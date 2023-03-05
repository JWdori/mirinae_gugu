import 'package:flutter/material.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:sound_stream/sound_stream.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_speech/google_speech.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/result_voice_quiz.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Questions{
  String qText;
  Questions(this.qText);
}

class StartPage_4 extends StatefulWidget {
  @override
  _StartPageState_4 createState() => _StartPageState_4();
}

class _StartPageState_4 extends State<StartPage_4> {
  final RecorderStream _recorder = RecorderStream();

  bool recognizing = false;
  bool recognizeFinished = false;
  var realtext = '';
  StreamSubscription<List<int>>? _audioStreamSubscription;
  BehaviorSubject<List<int>>? _audioStream;
  //text 안녕하세요
  String quiz = '안녕하세요';
  bool b = false;
  var testtext;
  int myindex = 0;
  String myoption = '';



  @override
  void initState() {
    super.initState();
    finish();
    _recorder.initialize();
  }
  @override
  void dispose() {


    _recorder.stop();
    _audioStreamSubscription?.cancel();
    _audioStream?.close();
    super.dispose();
  }
//
  void streamingRecognize() async {
    _audioStream = BehaviorSubject<List<int>>();
    _audioStreamSubscription = _recorder.audioStream.listen((event) {
      if (!_audioStream!.isClosed) {
        _audioStream?.add(event);
      }
    });

    await _recorder.start();

    setState(() {
      recognizing = true;
    });
    //서비스 계정. assets 폴더에 api key 넣음
    final serviceAccount = ServiceAccount.fromString(
        '${(await rootBundle.loadString(
            'assets/service_name.json'))}');
    final speechToText = SpeechToText.viaServiceAccount(serviceAccount);
    final config = _getConfig();

    final responseStream = speechToText.streamingRecognize(
        StreamingRecognitionConfig(config: config, interimResults: true),
        _audioStream!);

    var responseText = '';
    //마이크 입력 받았을 때 출력될 텍스트 설정.
    responseStream.listen((data) {
      final currentText =
      data.results.map((e) => e.alternatives.first.transcript).join("");
      if (data.results.first.isFinal) {
        if (mounted) {
          //responseText += currentText;
          setState(() {
            //text = responseText;
            recognizeFinished = true;
          });}
      } else {
        if (mounted) {
          setState(() {
            realtext = currentText;
            recognizeFinished = true;
          });
        }}
    },onDone: () {
      if (mounted) {
        setState(() {
          recognizing = false;

        });
      }});
  }

  //마이크 stop 했을 때
  void stopRecording() async {
    await _recorder.stop();
    await _audioStreamSubscription?.cancel();
    await _audioStream?.close();
    setState(() {
      recognizing = false;
    });
  }

  //google speech to text api 설정
  RecognitionConfig _getConfig() =>
      RecognitionConfig(
          encoding: AudioEncoding.LINEAR16,
          model: RecognitionModel.command_and_search,
          enableAutomaticPunctuation: false,
          sampleRateHertz: 16000,
          languageCode: 'ko-KR');

  //
  var counter=0;
  var questionnum = 1;

  List qList =[
    Questions("무슨 일이야?"),
    Questions("부재중입니다"),
    Questions("밥이 정말 맛있어요"),
    Questions("도와줘서 고마워"),
    Questions("공부하고 있어요"),
    Questions("빌릴 수 있을까요"),
    Questions("문제가 어렵네"),
    Questions("산책 중이야"),
    Questions("노래가 정말 좋네요"),
    Questions("뭐하고 있어?"),
  ];

  var score=0;

  void checkWin(String userChoice , BuildContext context)
  {
    String newtext = userChoice.replaceAll(' ', '');
    if(newtext==qList[counter].qText.replaceAll(' ', '')) {
      score= score+10;
      final snackbar = SnackBar(
          margin: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width*0.2.w,
              MediaQuery.of(context).size.height*0.25.h,
              MediaQuery.of(context).size.width*0.2.w,
              MediaQuery.of(context).size.height*0.5.h),
          duration: Duration(milliseconds :800 ), //500
          backgroundColor: Colors.lime[200],
          behavior: SnackBarBehavior.floating,
          elevation: 0,
          content: Semantics(
            label: "정답입니다.",
            child: Container(
              child: Icon(Icons.brightness_1_outlined, color: Colors.orange, size: 170),
            ),));
      Scaffold.of(context).showSnackBar(snackbar);
    }
    else{
      score = score+0;
      final snackbar = SnackBar(
          margin: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width*0.2.w,
              MediaQuery.of(context).size.height*0.25.h,
              MediaQuery.of(context).size.width*0.2.w,
              MediaQuery.of(context).size.height*0.5.h),
          duration: Duration(milliseconds : 800),
          backgroundColor: Colors.lime[200],
          behavior: SnackBarBehavior.floating,
          elevation: 0,
          content: Semantics(
            label: "오답입니다.",
            child: Container(
              margin: const EdgeInsets.fromLTRB(0,0,0,230),
              child: Icon(Icons.clear_rounded, color: Colors.orange, size: 170),
            ),
          ));
      Scaffold.of(context).showSnackBar(snackbar);
    }
  }

  void nextpage() {
    if (mounted) {
      setState(() {
        realtext = '';
        if(counter<qList.length-1) {
          questionnum = questionnum + 1;
          counter = counter +1;
        }
        else if (counter == qList.length-1){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ScorePage(lastscore: score),
            ),
          );
        }
      });}
  }

  void reset()
  {
    setState(() {
      //counter = 0;
      //score =0;
      realtext = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Builder(
        builder : (BuildContext context) => Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[


              Padding(padding: EdgeInsets.only(top: 20)),


              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
/*                    Text("Score : $score /100",style: TextStyle(color : Colors.brown ,
                        fontSize: 20,fontWeight: FontWeight.bold),),*/
                    Text("문제 : $questionnum / 10",style: TextStyle(color : Colors.brown ,
                        fontSize: 20.sp+size,fontWeight: FontWeight.bold),),

                  ],
                ),

              ),

              Padding(padding: EdgeInsets.only(top: 20)),
              Semantics(
                label: "문제입니다.",
                child: Container(
                  width: MediaQuery.of(context).size.width*0.8.w,
                  height: MediaQuery.of(context).size.height*0.45.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lime[200]
                  ),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.fromLTRB(50,30,50,20),
                          child: Text(qList[counter].qText,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0.sp+size,),)),
                      Container(
                        //margin: const EdgeInsets.fromLTRB(3,3,3,3),
                          child: Text('를 읽어주세요!',
                            style: TextStyle(fontSize: 18.0.sp+size,),)
                      )
                    ],
                  ),
                ),
              ),
              //Padding(padding: EdgeInsets.only(top: 30)),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Container(
                    child: Stack(
                      // text 프린트 해주는 함수 호출
                        children: <Widget>[
                          Semantics(
                            label: "받아쓰기 노트",
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.8.w,
                              height: MediaQuery.of(context).size.height*0.1.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10), //모서리를 둥글게
                                  border: Border.all(color: Colors.black12, width: 3),
                                  color: Color(0xffE4EDFF)
                              ), //테두리
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: textprint(),
                                  )],),),
                          )]
                    )
                ),
              ),

              Padding(padding: EdgeInsets.only(top: 30)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed:() {
                      checkWin(realtext.replaceAll(' ', ''), context);
                      reset();
                      Timer(Duration(seconds: 1), () {
                        nextpage();
                      });
                    },
                    padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),

                    color:  Color(0xff4573CB),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Semantics(
                      label: "다음 문제로 이동",
                      child: Text("채점",style: TextStyle(color: Colors.white,fontSize: 16.sp+size,fontWeight: FontWeight.bold),),
                    ),
                  ),

                  Semantics(
                    label: "",
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        IconButton(
                          padding: EdgeInsets.only(bottom: 3,),
                          onPressed: recognizing ? stopRecording : streamingRecognize,
                          icon: recognizing
                              ? Icon(Icons.mic, color: Colors.red, size: 28)
                              : Icon(Icons.mic, color: Colors.blue, size: 28),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 3),
                          child: Text("받아쓰기", style: TextStyle(height: 0.05.h,fontSize: 12.sp,color: Colors.black),textAlign: TextAlign.center,),
                        )
                      ],
                    ),),
                  InkWell(
                    child: RaisedButton(
                      onPressed:() {
                        reset();
                      },
                      padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),

                      color: Color(0xff4573CB),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),

                      child: Text("다시 쓰기",style: TextStyle(color: Colors.white,fontSize: 16.sp+size,fontWeight: FontWeight.bold),),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textprint() {
    if(recognizeFinished) {
      return Text(
          realtext,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            letterSpacing: 1.0,
            fontSize: 22.5.sp+size,
            height: 1.25.h,
          )
      );
    } else {
      return Text("");
    }
  }

  void finish() async{
    SharedPreferences s = await SharedPreferences.getInstance();
    await s.setBool("speaking14_2",true);
  }

}


