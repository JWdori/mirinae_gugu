import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mirinae_gugu/video/src/components/DefaultAppBar.dart';
import 'package:mirinae_gugu/video/src/pages/5_Education/5_0_Export.dart';
import 'package:mirinae_gugu/video/src/widget/button_Chapter.dart';

import '1_Loading.dart';
import '5_Education/update.dart';

class Word_Main extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Scrollbar(// <- Scaffold body만 감싼다.
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            SizedBox(height: 5.h),
            Text('낱말 학습', style: TextStyle(fontSize: 20.sp+size, color: Colors.black, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.h),
            ButtonChapter(onTap: Vocab_Screen_51(), number: 1, text: '새학년'),
            ButtonChapter(onTap: Vocab_Screen_52(), number: 2, text: '봄'),
            ButtonChapter(onTap: Vocab_Screen_53(), number: 3, text: '건강'),
            ButtonChapter(onTap: Vocab_Screen_54(), number: 4, text: '동물&곤충'),
            ButtonChapter(onTap: Vocab_Screen_55(), number: 5, text: '감정&행동'),
            ButtonChapter(onTap: Vocab_Screen_56(), number: 6, text: '여름'),
            ButtonChapter(onTap: Vocab_Screen_57(), number: 7, text: '과일&채소'),
            ButtonChapter(onTap: Vocab_Screen_58(), number: 8, text: '가을'),
            ButtonChapter(onTap: Vocab_Screen_59(), number: 9, text: '직업'),
            ButtonChapter(onTap: Vocab_Screen_510(), number: 10, text: '집'),
            ButtonChapter(onTap: Vocab_Screen_511(), number: 11, text: '겨울'),
            ButtonChapter(onTap: Vocab_Screen_512(), number: 12, text: '가족'),
            ButtonChapter(onTap: Vocab_Screen_513(), number: 13, text: '외래어'),
            ButtonChapter(onTap: Vocab_Screen_514(), number: 14, text: '문장(1)'),
            ButtonChapter(onTap: Vocab_Screen_515(), number: 15, text: '문장(2)'),
          ],
        ),
      ),),
      appBar: DefaultAppBar(title: '구구절절'),
    );
  }
}