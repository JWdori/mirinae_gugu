import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirinae_gugu/video/src/components/DefaultAppBar.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap10/Quiz_1/1_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap10/Quiz_3/3_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap10/Quiz_5/5_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap10/Quiz_2/2_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap10/Quiz_4/4_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap10/Quiz_6/6_Choice.dart';
import 'package:mirinae_gugu/video/src/widget/button_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Test_10 extends StatefulWidget{
  const Test_10({
    Key ?key,
  }) : super(key: key);
  @override
  _Test_10 createState() => _Test_10();
}
class _Test_10 extends State<Test_10>{
  bool speaking10_1 = false;
  bool speaking10_2 = false;
  bool speaking10_3 = false;
  bool reading10_1 = false;
  bool reading10_2 = false;
  bool reading10_3 = false;


  void loadnotification() async{
    SharedPreferences s = await SharedPreferences.getInstance();
    setState(() {
      speaking10_1 = s.getBool("speaking10_1")!;
      speaking10_2 = s.getBool("speaking10_2")!;
      speaking10_3 = s.getBool("speaking10_3")!;
      reading10_1 = s.getBool("reading10_1")!;
      reading10_2 = s.getBool("reading10_2")!;
      reading10_3 = s.getBool("reading10_3")!;
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
            Text('10단원. 복습 시험', style: TextStyle(fontSize: 20.sp+size, color: Colors.black, fontWeight: FontWeight.bold)),
        Semantics(
          label: "집 ",
            child: Container(
              height: MediaQuery.of(context).size.height*0.35.h,
              child:Image.asset('assets/test_chapter/10_house.png'),
            )),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  TestButton(text: '읽기1', color: Colors.blueAccent, icon: Icons.camera_alt,state: reading10_1, onTap: Choice101(),),
                TestButton(text: '말하기1', color: Colors.blueAccent, icon: Icons.mic, state: speaking10_1,onTap: Choice102(),), //StartPage()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TestButton(text: '읽기2', color: Colors.blueAccent, icon: Icons.camera_alt,state: reading10_2, onTap: Choice103(),),
                TestButton(text: '말하기2', color: Colors.blueAccent, icon: Icons.mic,state: speaking10_2, onTap: Choice104(),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TestButton(text: '읽기3', color: Colors.blueAccent, icon: Icons.camera_alt, state: reading10_3,onTap: Choice105(),),
                TestButton(text: '말하기3', color: Colors.blueAccent, icon: Icons.mic,state: speaking10_3, onTap: Choice106(),),
              ],
            ),
            SizedBox(height: 30.h),
          ],
      ),
      appBar: DefaultAppBar(title: '구구절절'),
    );
  }
}