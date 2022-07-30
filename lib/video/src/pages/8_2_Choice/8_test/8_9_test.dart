import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirinae_gugu/video/src/components/DefaultAppBar.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap9/Quiz_1/1_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap9/Quiz_3/3_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap9/Quiz_5/5_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap9/Quiz_2/2_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap9/Quiz_4/4_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap9/Quiz_6/6_Choice.dart';
import 'package:mirinae_gugu/video/src/widget/button_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Test_9 extends StatefulWidget{
  const Test_9({
    Key ?key,
  }) : super(key: key);
  @override
  _Test_9 createState() => _Test_9();
}
class _Test_9 extends State<Test_9>{
  bool speaking9_1 = false;
  bool speaking9_2 = false;
  bool speaking9_3 = false;
  bool reading9_1 = false;
  bool reading9_2 = false;
  bool reading9_3 = false;


  void loadnotification() async{
    SharedPreferences s = await SharedPreferences.getInstance();
    setState(() {
      speaking9_1 = s.getBool("speaking9_1")!;
      speaking9_2 = s.getBool("speaking9_2")!;
      speaking9_3 = s.getBool("speaking9_3")!;
      reading9_1 = s.getBool("reading9_1")!;
      reading9_2 = s.getBool("reading9_2")!;
      reading9_3 = s.getBool("reading9_3")!;
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
  Widget build(BuildContext context){
    loadnotification();
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 7.h),
            Text('9단원. 복습 시험', style: TextStyle(fontSize: 20.sp+size, color: Colors.black, fontWeight: FontWeight.bold)),
        Semantics(
          label: "직업 ",
            child: Container(
              height: MediaQuery.of(context).size.height*0.35.h,
              child:Image.asset('assets/test_chapter/9_work.png'),
            )),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  TestButton(text: '읽기1', color: Colors.blueAccent, icon: Icons.camera_alt,state: reading9_1, onTap: Choice91(),),
                TestButton(text: '말하기1', color: Colors.blueAccent, icon: Icons.mic,state: speaking9_1, onTap: Choice92(),), //StartPage()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TestButton(text: '읽기2', color: Colors.blueAccent, icon: Icons.camera_alt,state: reading9_3, onTap: Choice93(),),
                TestButton(text: '말하기2', color: Colors.blueAccent, icon: Icons.mic,state: speaking9_2, onTap: Choice94(),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TestButton(text: '읽기3', color: Colors.blueAccent, icon: Icons.camera_alt, state: reading9_3,onTap: Choice95(),),
                TestButton(text: '말하기3', color: Colors.blueAccent, icon: Icons.mic,state: speaking9_3, onTap: Choice96(),),
              ],
            ),
            SizedBox(height: 30.h),
          ],
      ),
      appBar: DefaultAppBar(title: '구구절절'),
    );
  }
}