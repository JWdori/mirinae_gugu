import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirinae_gugu/video/src/components/DefaultAppBar.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap14/Quiz_1/1_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap14/Quiz_3/3_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap14/Quiz_5/5_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap14/Quiz_2/2_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap14/Quiz_4/4_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap14/Quiz_6/6_Choice.dart';
import 'package:mirinae_gugu/video/src/widget/button_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Test_14 extends StatefulWidget{
  const Test_14({
    Key ?key,
  }) : super(key: key);
  @override
  _Test_14 createState() => _Test_14();
}
class _Test_14 extends State<Test_14>{
  bool speaking14_1 = false;
  bool speaking14_2 = false;
  bool speaking14_3 = false;
  bool reading14_1 = false;
  bool reading14_2 = false;
  bool reading14_3 = false;


  void loadnotification() async{
    SharedPreferences s = await SharedPreferences.getInstance();
    setState(() {
      speaking14_1 = s.getBool("speaking14_1")!;
      speaking14_2 = s.getBool("speaking14_2")!;
      speaking14_3 = s.getBool("speaking14_3")!;
      reading14_1 = s.getBool("reading14_1")!;
      reading14_2 = s.getBool("reading14_2")!;
      reading14_3 = s.getBool("reading14_3")!;
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
            Text('14단원. 복습 시험', style: TextStyle(fontSize: 20.sp+size, color: Colors.black, fontWeight: FontWeight.bold)),
        Semantics(
          label: "문장 1",
            child: Container(
              height: MediaQuery.of(context).size.height*0.35.h,
              child:Image.asset('assets/test_chapter/14_sentence1.jpeg'),
            )),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  TestButton(text: '읽기1', icon: Icons.camera_alt, color: Colors.blueAccent,state: reading14_1, onTap: Choice141(),),
                TestButton(text: '말하기1', icon: Icons.mic,  color: Colors.blueAccent, state: speaking14_1,onTap: Choice142(),), //StartPage()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TestButton(text: '읽기2', icon: Icons.camera_alt, color: Colors.blueAccent, state: reading14_2,onTap: Choice143(),),
                TestButton(text: '말하기2', icon: Icons.mic,  color: Colors.blueAccent, state: speaking14_2,onTap: Choice144(),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TestButton(text: '읽기3', icon: Icons.camera_alt, state: reading14_3,color: Colors.blueAccent, onTap: Choice145(),),
                TestButton(text: '말하기3', icon: Icons.mic,  state: speaking14_3,color: Colors.blueAccent,onTap: Choice146(),),
              ],
            ),
            SizedBox(height: 30.h),
          ],
      ),
      appBar: DefaultAppBar(title: '구구절절'),
    );
  }
}