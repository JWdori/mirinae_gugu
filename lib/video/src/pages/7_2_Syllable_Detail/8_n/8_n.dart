import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirinae_gugu/video/src/components/DefaultAppBar.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';
import 'package:mirinae_gugu/video/src/pages/7_2_Syllable_Detail/8_n/8_n_video_body.dart';
import 'package:mirinae_gugu/video/src/widget/learn_level_button.dart';
import 'package:mirinae_gugu/video/src/widget/learn_level_button_dumy.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class N extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: DefaultAppBar(title: '조음학습'),
        body: Center(
        child: Scrollbar(
            child: ListView(
                padding: const EdgeInsets.all(10.0),
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('잇몸소리',style: TextStyle(fontSize: 18.0.sp+size),),
                      SizedBox(width: 10.w),
                      Container(
                          height: 30.h,width: 30.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xff7ba6f9),
                            shape: BoxShape.circle,
                          ),
                          child: Text('ㄴ',style: TextStyle(fontSize: 19.sp+size, fontWeight: FontWeight.bold))
                      ),
                      SizedBox(width: 10.w),
                      Text('발음하기',style: TextStyle(fontSize: 18.0.sp+size)),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Image(image: AssetImage('assets/mouth/8_n.png')),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal:120,vertical: 10),
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text('비음',style:TextStyle(fontSize: 16.sp+size)),
                  ),
                  Text('입을 막고 코로 공기를 내보내면서 내는 소리',style:TextStyle(fontSize: 15.sp+size),textAlign: TextAlign.center,),
                  SizedBox(height: 5.h),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal:120,vertical: 10),
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text('잇몸소리',style:TextStyle(fontSize: 16.sp+size)),
                  ),
                  Text('혀끝을 앞니 뒤에 살짝 붙였다 떼며 발음',style:TextStyle(fontSize: 15.sp+size),textAlign: TextAlign.center,),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      LearnLevelButton(
                          text: '나',
                          onTap: () async {
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_8(
                              index:1,
                            ),));
                          }
                      ),
                      LearnLevelButton(
                          text: '냐',
                          onTap: () async {
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_8(
                              index:2,
                            ),));
                          }
                      ),
                      LearnLevelButton(
                          text: '너',
                          onTap: () async {
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_8(
                              index:3,
                            ),));
                          }
                      ),
                    ],
                  ), //바뱌버
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      LearnLevelButton(
                          text: '녀',
                          onTap: () async {
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_8(
                              index:4,
                            ),));
                          }
                      ),
                      LearnLevelButton(
                          text: '노',
                          onTap: () async {
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_8(
                              index:5,
                            ),));
                          }
                      ),
                      LearnLevelButton(
                          text: '뇨',
                          onTap: () async {
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_8(
                              index:6,
                            ),));
                          }
                      ),
                    ],
                  ), //벼부뷰
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      LearnLevelButton(
                          text: '누',
                          onTap: () async {
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_8(
                              index:7,
                            ),));
                          }
                      ),
                      LearnLevelButton(
                          text: '뉴',
                          onTap: () async {
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_8(
                              index:8,
                            ),));
                          }
                      ),
                      LearnLevelButton(
                          text: '느',
                          onTap: () async {
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_8(
                              index:9,
                            ),));

                          }
                      ),
                    ],
                  ), //보뵤브
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      LearnLevelButton(
                          text: '니',
                          onTap: () async {
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_8(
                              index:10,
                            ),));
                          }
                      ),
                      Dumybutton(),
                      Dumybutton(),
                    ],
                  ), //비
                ]
            )
        ))
    );
  }
}