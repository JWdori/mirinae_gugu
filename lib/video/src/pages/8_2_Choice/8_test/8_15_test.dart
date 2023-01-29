import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirinae_gugu/video/src/components/DefaultAppBar.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap15/Quiz_1/1_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap15/Quiz_3/3_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap15/Quiz_5/5_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap15/Quiz_2/2_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap15/Quiz_4/4_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap15/Quiz_6/6_Choice.dart';
import 'package:mirinae_gugu/video/src/widget/button_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Test_15 extends StatefulWidget{
  const Test_15({
    Key ?key,
  }) : super(key: key);
  @override
  _Test_15 createState() => _Test_15();
}
class _Test_15 extends State<Test_15>{
  bool speaking15_1 = false;
  bool speaking15_2 = false;
  bool speaking15_3 = false;
  bool reading15_1 = false;
  bool reading15_2 = false;
  bool reading15_3 = false;


  void loadnotification() async{
    SharedPreferences s = await SharedPreferences.getInstance();
    setState(() {
      speaking15_1 = s.getBool("speaking15_1")!;
      speaking15_2 = s.getBool("speaking15_2")!;
      speaking15_3 = s.getBool("speaking15_3")!;
      reading15_1 = s.getBool("reading15_1")!;
      reading15_2 = s.getBool("reading15_2")!;
      reading15_3 = s.getBool("reading15_3")!;
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
            Text('15단원. 복습 시험', style: TextStyle(fontSize: 20.sp+size, color: Colors.black, fontWeight: FontWeight.bold)),
        Semantics(
          label: "문장 2",
            child: Container(
              height: MediaQuery.of(context).size.height*0.35.h,
              child:Image.asset('assets/test_chapter/15_sentence2.jpeg'),
            )),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  TestButton(text: '읽기1', icon: Icons.camera_alt, color: Colors.blueAccent,state: reading15_1, onTap: Choice151(),),
                TestButton(text: '말하기1', icon: Icons.mic,  color: Colors.blueAccent, state: speaking15_1,onTap: Choice152(),), //StartPage()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TestButton(text: '읽기2', icon: Icons.camera_alt, color: Colors.blueAccent, state: reading15_2,onTap: Choice153(),),
                TestButton(text: '말하기2', icon: Icons.mic,  color: Colors.blueAccent, state: speaking15_2,onTap: Choice154(),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TestButton(text: '읽기3', icon: Icons.camera_alt, state: reading15_3,color: Colors.blueAccent, onTap: Choice155(),),
                TestButton(text: '말하기3', icon: Icons.mic,  state: speaking15_3,color: Colors.blueAccent,onTap: Choice156(),),
              ],
            ),
            SizedBox(height: 30.h),
          ],
      ),
      appBar: DefaultAppBar(title: '구구절절'),
    );
  }
}