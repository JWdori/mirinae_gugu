import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirinae_gugu/video/src/components/DefaultAppBar.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap12/Quiz_1/1_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap12/Quiz_3/3_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap12/Quiz_5/5_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap12/Quiz_2/2_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap12/Quiz_4/4_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap12/Quiz_6/6_Choice.dart';
import 'package:mirinae_gugu/video/src/widget/button_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Test_12 extends StatefulWidget{
  const Test_12({
    Key ?key,
  }) : super(key: key);
  @override
  _Test_12 createState() => _Test_12();
}
class _Test_12 extends State<Test_12>{
  bool speaking12_1 = false;
  bool speaking12_2 = false;
  bool speaking12_3 = false;
  bool reading12_1 = false;
  bool reading12_2 = false;
  bool reading12_3 = false;


  void loadnotification() async{
    SharedPreferences s = await SharedPreferences.getInstance();
    setState(() {
      speaking12_1 = s.getBool("speaking12_1")!;
      speaking12_2 = s.getBool("speaking12_2")!;
      speaking12_3 = s.getBool("speaking12_3")!;
      reading12_1 = s.getBool("reading12_1")!;
      reading12_2 = s.getBool("reading12_2")!;
      reading12_3 = s.getBool("reading12_3")!;
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
            Text('12단원. 복습 시험', style: TextStyle(fontSize: 20.sp+size, color: Colors.black, fontWeight: FontWeight.bold)),
        Semantics(
          label: "가족 ",
            child: Container(
              height: MediaQuery.of(context).size.height*0.35.h,
              child:Image.asset('assets/test_chapter/12_family.png'),
            )),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  TestButton(text: '읽기1', icon: Icons.camera_alt, color: Colors.blueAccent,state: reading12_1, onTap: Choice121(),),
                TestButton(text: '말하기1', icon: Icons.mic,  color: Colors.blueAccent, state: speaking12_1,onTap: Choice122(),), //StartPage()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TestButton(text: '읽기2', icon: Icons.camera_alt, color: Colors.blueAccent, state: reading12_2,onTap: Choice123(),),
                TestButton(text: '말하기2', icon: Icons.mic,  color: Colors.blueAccent, state: speaking12_2,onTap: Choice124(),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TestButton(text: '읽기3', icon: Icons.camera_alt, state: reading12_3,color: Colors.blueAccent, onTap: Choice125(),),
                TestButton(text: '말하기3', icon: Icons.mic,  state: speaking12_3,color: Colors.blueAccent,onTap: Choice126(),),
              ],
            ),
            SizedBox(height: 30.h),
          ],
      ),
      appBar: DefaultAppBar(title: '구구절절'),
    );
  }
}