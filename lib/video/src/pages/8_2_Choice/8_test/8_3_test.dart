import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirinae_gugu/video/src/components/DefaultAppBar.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap3/Quiz_1/1_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap3/Quiz_3/3_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap3/Quiz_5/5_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap3/Quiz_2/2_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap3/Quiz_4/4_Choice.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap3/Quiz_6/6_Choice.dart';
import 'package:mirinae_gugu/video/src/widget/button_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Test_3 extends StatefulWidget {
  const Test_3({
    Key ?key,
  }) : super(key: key);
  @override
  _Test_3 createState() => _Test_3();
}
class _Test_3 extends State<Test_3>{
  bool speaking3_1 = false;
  bool speaking3_2 = false;
  bool speaking3_3 = false;
  bool reading3_1 = false;
  bool reading3_2 = false;
  bool reading3_3 = false;


  void loadnotification() async{
    SharedPreferences s = await SharedPreferences.getInstance();
    setState(() {
      speaking3_1 = s.getBool("speaking3_1")!;
      speaking3_2 = s.getBool("speaking3_2")!;
      speaking3_3 = s.getBool("speaking3_3")!;
      reading3_1 = s.getBool("reading3_1")!;
      reading3_2 = s.getBool("reading3_2")!;
      reading3_3 = s.getBool("reading3_3")!;
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
          Text('3단원. 복습 시험', style: TextStyle(fontSize: 20.sp+size, color: Colors.black, fontWeight: FontWeight.bold)),
          Semantics(
              label: "건강 ",
              child: Container(
                height: MediaQuery.of(context).size.height*0.35.h,
                child:Image.asset('assets/test_chapter/3_health.png'),
              )),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TestButton(text: '읽기1',  color: Colors.blueAccent,icon: Icons.camera_alt,state: reading3_1, onTap: Choice31(),),
              TestButton(text: '말하기1', color: Colors.blueAccent, icon: Icons.mic,state: speaking3_1, onTap: Choice32(),), //StartPage()
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TestButton(text: '읽기2', color: Colors.blueAccent, icon: Icons.camera_alt,state: reading3_2, onTap: Choice33(),),
              TestButton(text: '말하기2', color: Colors.blueAccent, icon: Icons.mic, state: speaking3_2,onTap: Choice34(),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TestButton(text: '읽기3', color: Colors.blueAccent, icon: Icons.camera_alt, state: reading3_3,onTap: Choice35(),),
              TestButton(text: '말하기3', color: Colors.blueAccent, icon: Icons.mic, state: speaking3_3,onTap: Choice36(),),
            ],
          ),
          SizedBox(height: 30.h),
        ],
      ),
      appBar: DefaultAppBar(title: '구구절절'),
    );
  }
}