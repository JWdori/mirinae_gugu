import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirinae_gugu/video/src/components/DefaultAppBar.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';
import 'package:mirinae_gugu/video/src/widget/learn_level_button.dart';
import 'package:mirinae_gugu/video/src/widget/learn_level_button_dumy.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '12_j_video_body.dart';

class J extends StatelessWidget{
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
                      Text('센입천장소리',style: TextStyle(fontSize: 18.0.sp+size),),
                      SizedBox(width: 10.w),
                      Container(
                          height: 30.h,width: 30.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xff7ba6f9),
                            shape: BoxShape.circle,
                          ),
                          child: Text('ㅈ',style: TextStyle(fontSize: 19.sp+size, fontWeight: FontWeight.bold))
                      ),
                      SizedBox(width: 10.w),
                      Text('발음하기',style: TextStyle(fontSize: 18.0.sp+size)),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Image(image: AssetImage('assets/mouth/12_j.png')),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal:120,vertical: 10),
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text('파찰음',style:TextStyle(fontSize: 16.sp+size)),
                  ),
                  Text('폐에서 나오는 공기를 막았다가\n서서히 마찰을 일으켜서 내는 소리',style:TextStyle(fontSize: 15.sp+size),textAlign: TextAlign.center,),
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
                    child: Text('센입천장소리',style:TextStyle(fontSize: 16.sp+size)),
                  ),
                  Text('혓바닥을 입안 앞쪽에 붙였다가 떼면서 발음',style:TextStyle(fontSize: 15.sp+size),textAlign: TextAlign.center,),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      LearnLevelButton(
                          text: '자',
                          onTap: () async {
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_12_12(
                              index:1,
                            ),));}
                      ),
                      LearnLevelButton(
                          text: '쟈',
                          onTap: () async {

                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_12_12(
                              index:2,
                            ),));}
                      ),
                      LearnLevelButton(
                          text: '저',
                          onTap: () async {

                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_12_12(
                              index:3,
                            ),));}
                      ),
                    ],
                  ), //바뱌버
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      LearnLevelButton(
                          text: '져',
                          onTap: () async {

                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_12_12(
                              index:4,
                            ),));}
                      ),
                      LearnLevelButton(
                          text: '조',
                          onTap: () async {

                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_12_12(
                              index:5,
                            ),));}
                      ),
                      LearnLevelButton(
                          text: '죠',
                          onTap: () async {

                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_12_12(
                              index:6,
                            ),));}
                      ),
                    ],
                  ), //벼부뷰
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      LearnLevelButton(
                          text: '주',
                          onTap: () async {

                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_12_12(
                              index:7,
                            ),));}
                      ),
                      LearnLevelButton(
                          text: '쥬',
                          onTap: () async {

                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_12_12(
                              index:8,
                            ),));}
                      ),
                      LearnLevelButton(
                          text: '즈',
                          onTap: () async {

                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_12_12(
                              index:9,
                            ),));}
                      ),
                    ],
                  ), //보뵤브
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      LearnLevelButton(
                          text: '지',
                          onTap: () async {

                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_12_12(
                              index:10,
                            ),));}
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