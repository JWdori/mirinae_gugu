import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirinae_gugu/video/src/components/DefaultAppBar.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/8_test/8_0_Export.dart';
import 'package:mirinae_gugu/video/src/widget/button_Chapter.dart';

import '5_Education/update.dart';
class Test_Main extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(    // <- Scaffold body만 감싼다.
          child: ListView(
            padding: EdgeInsets.all(10),
            children: [
              SizedBox(height: 5),
              Text('복습 시험', style: TextStyle(fontSize: 20+size, color: Colors.black, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              ButtonChapter(onTap: Test_1(), number: 1, text: '새학년'),
              ButtonChapter(onTap: Test_2(), number: 2, text: '봄'),
              ButtonChapter(onTap: Test_3(), number: 3, text: '건강'),
              ButtonChapter(onTap: Test_4(), number: 4, text: '동물&곤충'),
              ButtonChapter(onTap: Test_5(), number: 5, text: '감정&행동'),
              ButtonChapter(onTap: Test_6(), number: 6, text: '여름'),
              ButtonChapter(onTap: Test_7(), number: 7, text: '과일&채소'),
              ButtonChapter(onTap: Test_8(), number: 8, text: '가을'),
              ButtonChapter(onTap: Test_9(), number: 9, text: '직업'),
              ButtonChapter(onTap: Test_10(), number: 10, text: '집'),
              ButtonChapter(onTap: Test_11(), number: 11, text: '겨울'),
              ButtonChapter(onTap: Test_12(), number: 12, text: '가족'),
              ButtonChapter(onTap: Test_13(), number: 13, text: '외래어 1'),
              ButtonChapter(onTap: Test_14(), number: 14, text: '문장 1'),
              ButtonChapter(onTap: Test_15(), number: 15, text: '문장 2'),
            ],
          ),
        ),
        appBar: DefaultAppBar(title: '구구절절'),
    );
  }
}