import 'package:flutter/material.dart';
import 'package:mirinae_gugu/video/src/components/DefaultAppBar.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScoreScreen extends StatefulWidget {
  ScoreScreen({Key? key, required this.lastscore}) : super(key : key);
  final int lastscore;
  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {

  List<String> images = [
    "assets/test_achievement/success.png",
    "assets/test_achievement/good.png",
    "assets/test_achievement/bad.png",
  ];
  late String message;
  late String image;

  @override
  void initState(){
    if(widget.lastscore<30){
      image = images[2];
      message = "조금 더 노력하세요..";
    }else if(widget.lastscore<80){
      image = images[1];
      message = "화이팅!";
    }else{
      image = images[0];
      message = "정말 잘하셨어요";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: '결과'),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Material(
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height:MediaQuery.of(context).size.height*0.15.h),
                    Material(
                      child: Container(
                        width: 300.0.w,
                        height: 300.0.h,
                        child: ClipRect(
                          child: Semantics(
                            label: message,
                          child: Image(
                            image: AssetImage(image,),
                          ),
                        )),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 15.0,
                        ),
                        child: Semantics(
                            label: "",
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                            message,
                            style: TextStyle(fontSize: 20.0.sp+size, fontWeight: FontWeight.bold,),
                            textAlign: TextAlign.center,
                          ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                Text(
                                  "당신의 점수는  ",
                                  style: TextStyle(fontSize: 20.0.sp+size, fontWeight: FontWeight.bold,),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "${widget.lastscore}",
                                  style: TextStyle(color: Colors.indigo, fontSize: 25.0.sp+size, fontWeight: FontWeight.bold,),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  " 점 입니다",
                                  style: TextStyle(fontSize: 20.0.sp+size, fontWeight: FontWeight.bold,),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ))
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 3.0, color: Colors.indigo),
                  ),
                  onPressed: () {Navigator.pop(context);},
                  child: Text("종료하기", style: TextStyle(fontSize: 18.0.sp+size, color: Colors.black)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}