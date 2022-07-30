import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirinae_gugu/video/src/components/DefaultAppBar.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap5/Quiz_1/1_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap5/Quiz_3/3_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap5/Quiz_5/5_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap5/Quiz_2/2_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap5/Quiz_4/4_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap5/Quiz_6/6_Choice.dart';
import 'package:mirinae_gugu/video/src/widget/button_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Test_5 extends StatefulWidget{
  const Test_5({
    Key ?key,
  }) : super(key: key);
  @override
  _Test_2 createState() => _Test_2();
}
class _Test_2 extends State<Test_5>{
  bool speaking1_1 = false;
  bool speaking1_2 = false;
  bool speaking1_3 = false;
  bool reading1_1 = false;
  bool reading1_2 = false;
  bool reading1_3 = false;


  void loadnotification() async{
    SharedPreferences s = await SharedPreferences.getInstance();
    setState(() {
      speaking1_1 = s.getBool("speaking5_1")!;
      speaking1_2 = s.getBool("speaking5_2")!;
      speaking1_3 = s.getBool("speaking5_3")!;
      reading1_1 = s.getBool("reading5_1")!;
      reading1_2 = s.getBool("reading5_2")!;
      reading1_3 = s.getBool("reading5_3")!;
    });
  }



  @override
  void initState() {
    super.initState();

  }
  @override
  void dispose() {
    super.dispose();

  }
  @override
  Widget build(BuildContext context){
    loadnotification();
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 7.h),
            Text('5단원. 복습 시험', style: TextStyle(fontSize: 20.sp+size, color: Colors.black, fontWeight: FontWeight.bold)),
        Semantics(
          label: "감정과 행동 ",
            child: Container(
              height: MediaQuery.of(context).size.height*0.35.h,
              child:Image.asset('assets/test_chapter/5_emotion.png'),
            )),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  TestButton(text: '읽기1', color: Colors.blueAccent, icon: Icons.camera_alt, state: reading1_1,onTap: Choice51(),),
                TestButton(text: '말하기1', color: Colors.blueAccent, icon: Icons.mic, state: speaking1_1,onTap: Choice52(),), //StartPage()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TestButton(text: '읽기2', color: Colors.blueAccent, icon: Icons.camera_alt,state: reading1_2, onTap: Choice53(),),
                TestButton(text: '말하기2', color: Colors.blueAccent, icon: Icons.mic,state: speaking1_2, onTap: Choice54(),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TestButton(text: '읽기3', color: Colors.blueAccent, icon: Icons.camera_alt, state: reading1_3,onTap: Choice55(),),
                TestButton(text: '말하기3', color: Colors.blueAccent, icon: Icons.mic, state: speaking1_3,onTap: Choice56(),),
              ],
            ),
            SizedBox(height: 30.h),
          ],
      ),
      appBar: DefaultAppBar(title: '구구절절'),
    );
  }
}