package com.mirinae_gugu

import android.Manifest
import android.content.pm.PackageManager
import android.media.AudioFormat
import android.media.AudioRecord
import android.media.MediaRecorder
import android.os.Build
import android.util.Log
import androidx.annotation.NonNull
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry
import java.io.*
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.util.*

class MainActivity: FlutterActivity() {
    private val LOG_NAME = "AndroidAudioRecorder"
    private val PERMISSIONS_REQUEST_RECORD_AUDIO = 200
    private val RECORDER_BPP: Byte = 16 // we use 16bit

    private val registrar: PluginRegistry.Registrar? = null
    private var mSampleRate = 16000 // 16Khz

    private var mRecorder: AudioRecord? = null
    private var mFilePath: String? = null
    private var mExtension: String? = null
    private var bufferSize = 1024
    private var mFileOutputStream: FileOutputStream? = null
    private var mStatus = "unset"
    private var mPeakPower = -120.0
    private var mAveragePower = -120.0
    private var mRecordingThread: Thread? = null
    private var mDataSize: Long = 0
    private var _result: Result? = null
    private val CHANNEL: String? ="mirinae_recorder"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->

            _result = result

            when (call.method) {
                "hasPermissions" -> handleHasPermission()
                "init" -> handleInit(call, result)
                "current" -> handleCurrent(call, result)
                "start" -> handleStart(call, result)
                "pause" -> handlePause(call, result)
                "resume" -> handleResume(call, result)
                "stop" -> handleStop(call, result)
                else -> result.notImplemented()
            }
        }
    }
    fun onRequestPermissionsResult(requestCode: Int, permissions: Array<String?>?, grantResults: IntArray): Boolean {
        val REQUEST_RECORD_AUDIO_PERMISSION = 200
        return when (requestCode) {
            REQUEST_RECORD_AUDIO_PERMISSION -> {
                var granted = true
                Log.d(LOG_NAME, "parsing result")
                for (result in grantResults) {
                    if (result != PackageManager.PERMISSION_GRANTED) {
                        Log.d(LOG_NAME, "result$result")
                        granted = false
                    }
                }
                Log.d(LOG_NAME, "onRequestPermissionsResult -$granted")
                if (_result != null) {
                    _result!!.success(granted)
                }
                granted
            }
            else -> {
                Log.d(LOG_NAME, "onRequestPermissionsResult - false")
                false
            }
        }
    }

    private fun hasRecordPermission(): Boolean {
        // if after [Marshmallow], we need to check permission on runtime
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            (registrar?.let { ContextCompat.checkSelfPermission(it.context(), Manifest.permission.RECORD_AUDIO) } === PackageManager.PERMISSION_GRANTED
                    && registrar?.let { ContextCompat.checkSelfPermission(it.context(), Manifest.permission.WRITE_EXTERNAL_STORAGE) } === PackageManager.PERMISSION_GRANTED)
        } else {
            registrar?.let { ContextCompat.checkSelfPermission(it.context(), Manifest.permission.RECORD_AUDIO) } === PackageManager.PERMISSION_GRANTED
        }
    }

    private fun handleHasPermission() {
        if (hasRecordPermission()) {
            Log.d(LOG_NAME, "handleHasPermission true")
            if (_result != null) {
                _result!!.success(true)
            }
        } else {
            Log.d(LOG_NAME, "handleHasPermission false")
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.M) {
                registrar?.let { ActivityCompat.requestPermissions(it.activity(), arrayOf<String>(Manifest.permission.RECORD_AUDIO, Manifest.permission.WRITE_EXTERNAL_STORAGE), PERMISSIONS_REQUEST_RECORD_AUDIO) }
            } else {
                registrar?.let { ActivityCompat.requestPermissions(it.activity(), arrayOf<String>(Manifest.permission.RECORD_AUDIO), PERMISSIONS_REQUEST_RECORD_AUDIO) }
            }
        }
    }

    private fun handleInit(call: MethodCall, result: Result) {
        resetRecorder()
        mSampleRate = Integer.parseInt(call.argument("sampleRate"))
        mFilePath = call.argument("path")
        mExtension = call.argument("extension")
        bufferSize = AudioRecord.getMinBufferSize(mSampleRate, AudioFormat.CHANNEL_IN_MONO, AudioFormat.ENCODING_PCM_16BIT)
        mStatus = "initialized"
        val initResult: HashMap<String, Any> = HashMap()
        initResult.put("duration", "0")
        mFilePath?.let { initResult.put("path", it) }
        mExtension?.let { initResult.put("audioFormat", it) }
        initResult.put("peakPower", mPeakPower)
        initResult.put("averagePower", mAveragePower)
        initResult.put("isMeteringEnabled", true)
        initResult.put("status", mStatus)
        result.success(initResult)
    }

    private fun handleCurrent(call: MethodCall, result: Result) {
        val currentResult: HashMap<String, Any> = HashMap()
        currentResult.put("duration", getDuration() * 1000)
        if (mStatus === "stopped") mFilePath else getTempFilename()?.let { currentResult.put("path", it) }
        mExtension?.let { currentResult.put("audioFormat", it) }
        currentResult.put("peakPower", mPeakPower)
        currentResult.put("averagePower", mAveragePower)
        currentResult.put("isMeteringEnabled", true)
        currentResult.put("status", mStatus)
        // Log.d(LOG_NAME, currentResult.toString());
        result.success(currentResult)
    }

    private fun handleStart(call: MethodCall, result: Result) {
        mRecorder = AudioRecord(MediaRecorder.AudioSource.MIC, mSampleRate, AudioFormat.CHANNEL_IN_MONO, AudioFormat.ENCODING_PCM_16BIT, bufferSize)
        try {
            mFileOutputStream = FileOutputStream(getTempFilename())
        } catch (e: FileNotFoundException) {
            result.error("", "cannot find the file", null)
            return
        }
        mRecorder!!.startRecording()
        mStatus = "recording"
        startThread()
        result.success(null)
    }

    private fun startThread() {
        mRecordingThread = Thread(Runnable {
            processAudioStream()
        },"Audio Processing Thread")

        mRecordingThread!!.start()
    }

    private fun handlePause(call: MethodCall, result: Result) {
        mStatus = "paused"
        mPeakPower = -120.0
        mAveragePower = -120.0
        mRecorder?.stop()
        mRecordingThread = null
        result.success(null)
    }

    private fun handleResume(call: MethodCall, result: Result) {
        mStatus = "recording"
        mRecorder?.startRecording()
        startThread()
        result.success(null)
    }

    private fun handleStop(call: MethodCall, result: Result) {
        if (mStatus.equals("stopped")) {
            result.success(null)
        } else {
            mStatus = "stopped"

            // Return Recording Object
            val currentResult: HashMap<String, Any> = HashMap()
            currentResult.put("duration", getDuration() * 1000)
            mFilePath?.let { currentResult.put("path", it) }
            mExtension?.let { currentResult.put("audioFormat", it) }
            currentResult.put("peakPower", mPeakPower)
            currentResult.put("averagePower", mAveragePower)
            currentResult.put("isMeteringEnabled", true)
            currentResult.put("status", mStatus)
            resetRecorder()
            mRecordingThread = null
            mRecorder?.stop()
            mRecorder!!.release()
            try {
                mFileOutputStream?.close()
            } catch (e: IOException) {
                e.printStackTrace()
            }
            Log.d(LOG_NAME, "before adding the wav header")
            copyWaveFile(getTempFilename(), mFilePath!!)
            deleteTempFile()

            // Log.d(LOG_NAME, currentResult.toString());
            result.success(currentResult)
        }
    }

    private fun processAudioStream() {
        Log.d(LOG_NAME, "processing the stream: $mStatus")
        val size = bufferSize
        val bData = ByteArray(size)
        while (mStatus === "recording") {
            Log.d(LOG_NAME, "reading audio data")
            mRecorder?.read(bData, 0, bData.size)
            mDataSize += bData.size
            updatePowers(bData)
            try {
                mFileOutputStream?.write(bData)
            } catch (e: IOException) {
                e.printStackTrace()
            }
        }
    }

    private fun deleteTempFile() {
        val file = File(getTempFilename())
        if (file.exists()) {
            file.delete()
        }
    }

    private fun getTempFilename(): String {
        return "$mFilePath.temp"
    }

    private fun copyWaveFile(inFilename: String, outFilename: String) {
        var `in`: FileInputStream? = null
        var out: FileOutputStream? = null
        var totalAudioLen: Long = 0
        var totalDataLen = totalAudioLen + 36
        val longSampleRate = mSampleRate.toLong()
        val channels = 1
        val byteRate = (RECORDER_BPP * mSampleRate * channels / 8).toLong()
        val data = ByteArray(bufferSize)
        try {
            `in` = FileInputStream(inFilename)
            out = FileOutputStream(outFilename)
            totalAudioLen = `in`.getChannel().size()
            totalDataLen = totalAudioLen + 36
            WriteWaveFileHeader(out, totalAudioLen, totalDataLen,
                longSampleRate, channels, byteRate)
            while (`in`.read(data) !== -1) {
                out.write(data)
            }
            `in`.close()
            out.close()
        } catch (e: FileNotFoundException) {
            e.printStackTrace()
        } catch (e: IOException) {
            e.printStackTrace()
        }
    }

    @kotlin.Throws(IOException::class)
    private fun WriteWaveFileHeader(out: FileOutputStream?, totalAudioLen: Long,
                                    totalDataLen: Long, longSampleRate: Long, channels: Int, byteRate: Long) {
        val header = ByteArray(44)
        header[0] = 'R'.toByte() // RIFF/WAVE header
        header[1] = 'I'.toByte()
        header[2] = 'F'.toByte()
        header[3] = 'F'.toByte()
        header[4] = (totalDataLen and 0xff).toByte()
        header[5] = (totalDataLen shr 8 and 0xff).toByte()
        header[6] = (totalDataLen shr 16 and 0xff).toByte()
        header[7] = (totalDataLen shr 24 and 0xff).toByte()
        header[8] = 'W'.toByte()
        header[9] = 'A'.toByte()
        header[10] = 'V'.toByte()
        header[11] = 'E'.toByte()
        header[12] = 'f' .toByte()// 'fmt ' chunk
        header[13] = 'm'.toByte()
        header[14] = 't'.toByte()
        header[15] = ' '.toByte()
        header[16] = 16 // 4 bytes: size of 'fmt ' chunk
        header[17] = 0
        header[18] = 0
        header[19] = 0
        header[20] = 1 // format = 1
        header[21] = 0
        header[22] = channels.toByte()
        header[23] = 0
        header[24] = (longSampleRate and 0xff).toByte()
        header[25] = (longSampleRate shr 8 and 0xff).toByte()
        header[26] = (longSampleRate shr 16 and 0xff).toByte()
        header[27] = (longSampleRate shr 24 and 0xff).toByte()
        header[28] = (byteRate and 0xff).toByte()
        header[29] = (byteRate shr 8 and 0xff).toByte()
        header[30] = (byteRate shr 16 and 0xff).toByte()
        header[31] = (byteRate shr 24 and 0xff).toByte()
        header[32] = 1.toByte() // block align
        header[33] = 0
        header[34] = RECORDER_BPP // bits per sample
        header[35] = 0
        header[36] = 'd'.toByte()
        header[37] = 'a'.toByte()
        header[38] = 't'.toByte()
        header[39] = 'a'.toByte()
        header[40] = (totalAudioLen and 0xff).toByte()
        header[41] = (totalAudioLen shr 8 and 0xff).toByte()
        header[42] = (totalAudioLen shr 16 and 0xff).toByte()
        header[43] = (totalAudioLen shr 24 and 0xff).toByte()
        if (out != null) {
            out.write(header, 0, 44)
        }
    }

    private fun byte2short(bData: ByteArray): ShortArray {
        val out = ShortArray(bData.size / 2)
        ByteBuffer.wrap(bData).order(ByteOrder.LITTLE_ENDIAN).asShortBuffer().get(out)
        return out
    }

    private fun resetRecorder() {
        mPeakPower = -120.0
        mAveragePower = -120.0
        mDataSize = 0
    }

    private fun updatePowers(bdata: ByteArray) {
        val data = byte2short(bdata)
        val sampleVal = data[data.size - 1]
        val escapeStatusList = arrayOf("paused", "stopped", "initialized", "unset")
        mAveragePower = if (sampleVal.toInt() == 0 || Arrays.asList(escapeStatusList).contains(mStatus)) {
            -120.0 // to match iOS silent case
        } else {
            // iOS factor : to match iOS power level
            val iOSFactor = 0.25
            20 * Math.log(Math.abs(sampleVal.toInt()) / 32768.0) * iOSFactor
        }
        mPeakPower = mAveragePower
        // Log.d(LOG_NAME, "Peak: " + mPeakPower + " average: "+ mAveragePower);
    }

    private fun getDuration(): Int {
        val duration = mDataSize / (mSampleRate * 2 * 1)
        return duration.toInt()
    }
}