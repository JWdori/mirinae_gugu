import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirinae_gugu/video/src/components/DefaultAppBar.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap13/Quiz_1/1_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap13/Quiz_3/3_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap13/Quiz_5/5_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap13/Quiz_2/2_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap13/Quiz_4/4_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap13/Quiz_6/6_Choice.dart';
import 'package:mirinae_gugu/video/src/widget/button_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Test_13 extends StatefulWidget{
  const Test_13({
    Key ?key,
  }) : super(key: key);
  @override
  _Test_13 createState() => _Test_13();
}
class _Test_13 extends State<Test_13>{
  bool speaking13_1 = false;
  bool speaking13_2 = false;
  bool speaking13_3 = false;
  bool reading13_1 = false;
  bool reading13_2 = false;
  bool reading13_3 = false;


  void loadnotification() async{
    SharedPreferences s = await SharedPreferences.getInstance();
    setState(() {
      speaking13_1 = s.getBool("speaking13_1")!;
      speaking13_2 = s.getBool("speaking13_2")!;
      speaking13_3 = s.getBool("speaking13_3")!;
      reading13_1 = s.getBool("reading13_1")!;
      reading13_2 = s.getBool("reading13_2")!;
      reading13_3 = s.getBool("reading13_3")!;
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
            Text('13단원. 복습 시험', style: TextStyle(fontSize: 20.sp+size, color: Colors.black, fontWeight: FontWeight.bold)),
        Semantics(
          label: "외래어 1",
            child: Container(
              height: MediaQuery.of(context).size.height*0.35.h,
              child:Image.asset('assets/test_chapter/13_foreign.png'),
            )),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  TestButton(text: '읽기1', icon: Icons.camera_alt, color: Colors.blueAccent,state: reading13_1, onTap: Choice131(),),
                TestButton(text: '말하기1', icon: Icons.mic,  color: Colors.blueAccent, state: speaking13_1,onTap: Choice132(),), //StartPage()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TestButton(text: '읽기2', icon: Icons.camera_alt, color: Colors.blueAccent, state: reading13_2,onTap: Choice133(),),
                TestButton(text: '말하기2', icon: Icons.mic,  color: Colors.blueAccent, state: speaking13_2,onTap: Choice134(),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TestButton(text: '읽기3', icon: Icons.camera_alt, state: reading13_3,color: Colors.blueAccent, onTap: Choice135(),),
                TestButton(text: '말하기3', icon: Icons.mic,  state: speaking13_3,color: Colors.blueAccent,onTap: Choice136(),),
              ],
            ),
            SizedBox(height: 30.h),
          ],
      ),
      appBar: DefaultAppBar(title: '구구절절'),
    );
  }
}