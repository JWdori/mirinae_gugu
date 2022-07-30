import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirinae_gugu/video/src/components/DefaultAppBar.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap11/Quiz_1/1_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap11/Quiz_3/3_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap11/Quiz_5/5_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap11/Quiz_2/2_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap11/Quiz_4/4_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap11/Quiz_6/6_Choice.dart';
import 'package:mirinae_gugu/video/src/widget/button_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Test_11 extends StatefulWidget{
  const Test_11({
    Key ?key,
  }) : super(key: key);
  @override
  _Test_11 createState() => _Test_11();
}
class _Test_11 extends State<Test_11>{
  bool speaking11_1 = false;
  bool speaking11_2 = false;
  bool speaking11_3 = false;
  bool reading11_1 = false;
  bool reading11_2 = false;
  bool reading11_3 = false;


  void loadnotification() async{
    SharedPreferences s = await SharedPreferences.getInstance();
    setState(() {
      speaking11_1 = s.getBool("speaking11_1")!;
      speaking11_2 = s.getBool("speaking11_2")!;
      speaking11_3 = s.getBool("speaking11_3")!;
      reading11_1 = s.getBool("reading11_1")!;
      reading11_2 = s.getBool("reading11_2")!;
      reading11_3 = s.getBool("reading11_3")!;
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
            Text('11단원. 복습 시험', style: TextStyle(fontSize: 20.sp+size, color: Colors.black, fontWeight: FontWeight.bold)),
        Semantics(
          label: "겨울 ",
            child: Container(
              height: MediaQuery.of(context).size.height*0.35.h,
              child:Image.asset('assets/test_chapter/11_winter.png'),
            )),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  TestButton(text: '읽기1', color: Colors.blueAccent, icon: Icons.camera_alt,state: reading11_1, onTap: Choice111(),),
                TestButton(text: '말하기1', color: Colors.blueAccent, icon: Icons.mic,state: speaking11_1, onTap: Choice112(),), //StartPage()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TestButton(text: '읽기2', color: Colors.blueAccent, icon: Icons.camera_alt,state: reading11_2, onTap: Choice113(),),
                TestButton(text: '말하기2', color: Colors.blueAccent, icon: Icons.mic, state: speaking11_2,onTap: Choice114(),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TestButton(text: '읽기3', color: Colors.blueAccent, icon: Icons.camera_alt, state: reading11_3,onTap: Choice115(),),
                TestButton(text: '말하기3', color: Colors.blueAccent, icon: Icons.mic,state: speaking11_3, onTap: Choice116(),),
              ],
            ),
            SizedBox(height: 30.h),
          ],
      ),
      appBar: DefaultAppBar(title: '구구절절'),
    );
  }
}