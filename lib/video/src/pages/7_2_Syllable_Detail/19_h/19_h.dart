import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirinae_gugu/video/src/components/DefaultAppBar.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';
import 'package:mirinae_gugu/video/src/widget/learn_level_button.dart';
import 'package:mirinae_gugu/video/src/widget/learn_level_button_dumy.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '19_h_video_body.dart';

class H extends StatelessWidget{
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
                      Text('목청소리',style: TextStyle(fontSize: 18.0.sp+size),),
                      SizedBox(width: 10.w),
                      Container(
                          height: 30.h,width: 30.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xff7ba6f9),
                            shape: BoxShape.circle,
                          ),
                          child: Text('ㅎ',style: TextStyle(fontSize: 19.sp+size, fontWeight: FontWeight.bold))
                      ),
                      SizedBox(width: 10.w),
                      Text('발음하기',style: TextStyle(fontSize: 18.0.sp+size)),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Image(image: AssetImage('assets/mouth/19_h.png')),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal:120,vertical: 10),
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text('마찰음',style:TextStyle(fontSize: 16.sp+size)),
                  ),
                  Text('입안이나 목청 사이의 통로를 좁혀\n그 사이로 공기를 내보내면서 내는 소리',style:TextStyle(fontSize: 15.sp+size),textAlign: TextAlign.center,),
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
                    child: Text('목청소리',style:TextStyle(fontSize: 16.sp+size)),
                  ),
                  Text('목구멍에서 나는 소리',style:TextStyle(fontSize: 15.sp+size),textAlign: TextAlign.center,),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      LearnLevelButton(
                          text: '하',
                          onTap: () async {
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_19_19(
                              index:1,
                            ),));}
                      ),
                      LearnLevelButton(
                          text: '햐',
                          onTap: () async {
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_19_19(
                              index:2,
                            ),));}
                      ),
                      LearnLevelButton(
                          text: '허',
                          onTap: () async {
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_19_19(
                              index:3,
                            ),));}
                      ),
                    ],
                  ), //바뱌버
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      LearnLevelButton(
                          text: '혀',
                          onTap: () async {
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_19_19(
                              index:4,
                            ),));}
                      ),
                      LearnLevelButton(
                          text: '호',
                          onTap: () async {
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_19_19(
                              index:5,
                            ),));}
                      ),
                      LearnLevelButton(
                          text: '효',
                          onTap: () async {
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_19_19(
                              index:6,
                            ),));}
                      ),
                    ],
                  ), //벼부뷰
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      LearnLevelButton(
                          text: '후',
                          onTap: () async {
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_19_19(
                              index:7,
                            ),));}
                      ),
                      LearnLevelButton(
                          text: '휴',
                          onTap: () async {
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_19_19(
                              index:8,
                            ),));}
                      ),
                      LearnLevelButton(
                          text: '흐',
                          onTap: () async {
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_19_19(
                              index:9,
                            ),));}
                      ),
                    ],
                  ), //보뵤브
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      LearnLevelButton(
                          text: '히',
                          onTap: () async {
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => video_Body_19_19(
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