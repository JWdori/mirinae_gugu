import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:noise_meter/noise_meter.dart';

//소음 측정 animation_bar
class Noise extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Noise();
}

class _Noise extends State<StatefulWidget> {
  NoiseMeter noiseMeter = NoiseMeter((err) {});
  StreamSubscription<NoiseReading>? subscription;

  final int limitDecibel = 90;
  int minlimitDecibel =30;
  int currentDecibel = 0;
  double a = 0;

  bool? get isInfinite => null;

  bool? get isNaN => null;

  @override
  void dispose() {
    subscription!.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    subscription = noiseMeter.noiseStream.listen(onData);
  }

  // 50보다 작으면 현재 데시벨-30으로 해주고 50~60사이이면 -20 65~70 사이이면 +5, 70~75이면 +15,75이상이면 100(max)
  //바 변화를 극단적으로 하려고 이렇게 바꿈.

  void onData(NoiseReading sound) {
    setState(() {
      if (sound.maxDecibel.isNaN || sound.maxDecibel.isInfinite){
      }
      else{
        int decibel = sound.maxDecibel.toInt();
        currentDecibel = decibel;
      }
      if (currentDecibel < 50){
        currentDecibel = 0;
      }
      else if(currentDecibel >= 85){
        currentDecibel = 100;
      }
      else{
        a = (currentDecibel-50)*(85/50);
        currentDecibel = a.toInt();

      }
    });
  }

// 이 부분은 FAprogressBar부분으로 옮김 효과적인지는 모르겠는데 일단바꿔봤음
/*  bool isSafeDecibel() {
    print(currentDecibel);
    return currentDecibel < limitDecibel && currentDecibel > minlimitDecibel;
  }*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Column(
                    children: [

                      FAProgressBar(
                        size: 12,
                        currentValue: currentDecibel,
                        maxValue: limitDecibel,
                        animatedDuration: const Duration(milliseconds: 300),
                        direction: Axis.horizontal,
                        verticalDirection: VerticalDirection.up,
                        //limitdecibel과 minlimitdecibel 사이이면 초록 아님 빨강
                        progressColor: currentDecibel < limitDecibel && currentDecibel > minlimitDecibel ? Colors.green : Colors.red,
                        backgroundColor: Colors.grey,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}