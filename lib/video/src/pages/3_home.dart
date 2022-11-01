import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:mirinae_gugu/video/src/pages/10_Notification/10_Notification.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';

import 'package:mirinae_gugu/video/src/pages/7_1_Syllable_Main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '4_Word_Main.dart';
import '8_Test_Main.dart';
import '9_setting/9_Walkthrough.dart';

//업데이트 시 3개의 reading7를 다른 것으로 바꾸기만 하면 됩니다.
class Home extends StatefulWidget{
  const Home({Key? key}) : super(key: key);
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  DateTime? currentBackPressTime;
  bool Reading = false;
  List<bool> favorite_1 = <bool>[
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  void loadnotification() async {
    SharedPreferences s = await SharedPreferences.getInstance();

    setState(() {
      Reading = s.getBool("reading11")!;
    }
    );
  }


  aa(BuildContext context, String title) {
    showDialog(context: context, barrierDismissible: false,
        barrierColor: Colors.grey, builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title:
            Center(child: Text(title, style: TextStyle(fontSize: 24),)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SizedBox(height: 1.h),
                Text("원활한 사용을 위한 사용 안내입니다.", style: TextStyle(fontSize: 15),),


              ],
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences
                      .getInstance();
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => WalkthroughScreen()));
                  if (prefs.getBool('tutorial37') != true) {
                    prefs.setBool('tutorial37', true);
                  }
                },
                child: Text("확인", style: TextStyle(color: Colors.black),),
              ),
              CupertinoDialogAction(
                onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences
                      .getInstance();
                  if (prefs.getBool('tutorial37') != true) {
                    prefs.setBool('tutorial37', true);
                  }
                  Navigator.of(context).pop();
                },
                child: Text("SKIP", style: TextStyle(color: Colors.black),),
              ),
            ],
          );
        });
  }


  void local2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    SharedPreferences s = await SharedPreferences.getInstance();
    SharedPreferences ss = await SharedPreferences.getInstance();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (prefs.getBool('tutorial37') == null) {
        aa(context, "사용 가이드");

        s.setBool("reading11", false);


        s.setBool("reading1_1", false);
        s.setBool("reading1_2", false);
        s.setBool("reading1_3", false);
        s.setBool("speaking1_1", false);
        s.setBool("speaking1_2", false);
        s.setBool("speaking1_3", false);

        s.setBool("reading2_1", false);
        s.setBool("reading2_2", false);
        s.setBool("reading2_3", false);
        s.setBool("speaking2_1", false);
        s.setBool("speaking2_2", false);
        s.setBool("speaking2_3", false);

        s.setBool("reading3_1", false);
        s.setBool("reading3_2", false);
        s.setBool("reading3_3", false);
        s.setBool("speaking3_1", false);
        s.setBool("speaking3_2", false);
        s.setBool("speaking3_3", false);

        s.setBool("reading4_1", false);
        s.setBool("reading4_2", false);
        s.setBool("reading4_3", false);
        s.setBool("speaking4_1", false);
        s.setBool("speaking4_2", false);
        s.setBool("speaking4_3", false);

        s.setBool("reading5_1", false);
        s.setBool("reading5_2", false);
        s.setBool("reading5_3", false);
        s.setBool("speaking5_1", false);
        s.setBool("speaking5_2", false);
        s.setBool("speaking5_3", false);

        s.setBool("reading6_1", false);
        s.setBool("reading6_2", false);
        s.setBool("reading6_3", false);
        s.setBool("speaking6_1", false);
        s.setBool("speaking6_2", false);
        s.setBool("speaking6_3", false);

        s.setBool("reading7_1", false);
        s.setBool("reading7_2", false);
        s.setBool("reading7_3", false);
        s.setBool("speaking7_1", false);
        s.setBool("speaking7_2", false);
        s.setBool("speaking7_3", false);

        s.setBool("reading8_1", false);
        s.setBool("reading8_2", false);
        s.setBool("reading8_3", false);
        s.setBool("speaking8_1", false);
        s.setBool("speaking8_2", false);
        s.setBool("speaking8_3", false);

        s.setBool("reading9_1", false);
        s.setBool("reading9_2", false);
        s.setBool("reading9_3", false);
        s.setBool("speaking9_1", false);
        s.setBool("speaking9_2", false);
        s.setBool("speaking9_3", false);

        s.setBool("reading10_1", false);
        s.setBool("reading10_2", false);
        s.setBool("reading10_3", false);
        s.setBool("speaking10_1", false);
        s.setBool("speaking10_2", false);
        s.setBool("speaking10_3", false);

        s.setBool("reading11_1", false);
        s.setBool("reading11_2", false);
        s.setBool("reading11_3", false);
        s.setBool("speaking11_1", false);
        s.setBool("speaking11_2", false);
        s.setBool("speaking11_3", false);

        s.setBool("reading12_1", false);
        s.setBool("reading12_2", false);
        s.setBool("reading12_3", false);
        s.setBool("speaking12_1", false);
        s.setBool("speaking12_2", false);
        s.setBool("speaking12_3", false);

        s.setBool("reading13_1", false);
        s.setBool("reading13_2", false);
        s.setBool("reading13_3", false);
        s.setBool("speaking13_1", false);
        s.setBool("speaking13_2", false);
        s.setBool("speaking13_3", false);

        prefs.setInt('fontchoose', 1);
        ss.setString('fontsize', "보통");
        //조음학습

        //낱말학습
        prefs.setStringList("favorite_1_",
            favorite_1.map((value) => value.toString()).toList());
        prefs.setStringList(
            "favorite_2", favorite_1.map((value) => value.toString()).toList());
        prefs.setStringList(
            "favorite_3", favorite_1.map((value) => value.toString()).toList());
        prefs.setStringList(
            "favorite_4", favorite_1.map((value) => value.toString()).toList());
        prefs.setStringList(
            "favorite_5", favorite_1.map((value) => value.toString()).toList());
        prefs.setStringList(
            "favorite_6", favorite_1.map((value) => value.toString()).toList());
        prefs.setStringList(
            "favorite_7", favorite_1.map((value) => value.toString()).toList());
        prefs.setStringList(
            "favorite_8", favorite_1.map((value) => value.toString()).toList());
        prefs.setStringList("favorite_9_",
            favorite_1.map((value) => value.toString()).toList());
        prefs.setStringList("favorite_10_",
            favorite_1.map((value) => value.toString()).toList());
        prefs.setStringList("favorite_11_",
            favorite_1.map((value) => value.toString()).toList());
        prefs.setStringList("favorite_12_",
            favorite_1.map((value) => value.toString()).toList());
        prefs.setStringList("favorite_13_",
            favorite_1.map((value) => value.toString()).toList());
        prefs.setStringList("favorite_14_",
            favorite_1.map((value) => value.toString()).toList());
        prefs.setStringList("favorite_15_",
            favorite_1.map((value) => value.toString()).toList());
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    loadnotification();
    local2();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WillPopScope(
          onWillPop: onWillPop,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: (MediaQuery
                      .of(context)
                      .size
                      .height - MediaQuery
                      .of(context)
                      .padding
                      .top) * 0.15,
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    color: Color(0xff9CBBF7),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: Offset(2, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text('행복한\n하루되세요~~', style: TextStyle(
                                fontSize: 16.0.sp + size,
                                fontWeight: FontWeight.bold))
                        ),
                        CircleAvatar(
                          radius: 8.w,
                          backgroundColor: Colors.grey,
                          backgroundImage: AssetImage('assets/duk2.jpg'),
                        )
                      ]
                  ),
                ),
                SizedBox(height: 0.8.h),
                Align(

                  alignment: Alignment.centerLeft,
                  child: Text('     학습하기', style: TextStyle(
                      fontSize: 16.sp + size, fontWeight: FontWeight.bold)),
                ),
                FlatButton(
                  height: (MediaQuery
                      .of(context)
                      .size
                      .height - MediaQuery
                      .of(context)
                      .padding
                      .top) * 0.15,
                  color: Color(0xffE4EDFF),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => Syllable_pages()),);
                  },
                  child: Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(

                            margin: EdgeInsets.only(left: 30),
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Color(0xff4573CB),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(40)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.8),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: Offset(
                                      2, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Center(

                                child: Text('조음\n학습', style: TextStyle(
                                    fontSize: 14.sp + size,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))
                            ),

                          ),

                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 50),
                                    child: Column(children: <Widget>[
                                      Text('학습하기', style: TextStyle(
                                          fontSize: 14.sp + size,
                                          color: Colors.black87)),
                                      Text('', style: TextStyle(
                                        fontSize: 1.sp,)),
                                      Text('조음별 발음 학습', style: TextStyle(
                                          fontSize: 11.sp + size,
                                          color: Colors.black54)),
                                    ]
                                    )
                                )
                              ]
                          ),
                          Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Container(
                                    child: Icon(
                                      Icons.arrow_forward_ios_sharp, size: 8.w,
                                      color: Colors.black54,),
                                  ),
                                )
                              ]
                          )
                        ]
                    ),
                  ),
                ),
                FlatButton(
                  height: (MediaQuery
                      .of(context)
                      .size
                      .height - MediaQuery
                      .of(context)
                      .padding
                      .top) * 0.15,
                  color: Color(0xffE4EDFF),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Word_Main()),);
                  },
                  child: Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 30),
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Color(0xff4573CB),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(40)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.8),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: Offset(
                                      2, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Center(
                                child: Text('낱말\n학습', style: TextStyle(
                                    fontSize: 14.sp + size,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))
                            ),
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 50),
                                    child: Column(children: <Widget>[
                                      Text('학습하기', style: TextStyle(
                                          fontSize: 14.sp + size,
                                          color: Colors.black87)),
                                      Text('', style: TextStyle(
                                        fontSize: 1,)),
                                      Text('단원별 발음 학습', style: TextStyle(
                                          fontSize: 11.sp + size,
                                          color: Colors.black54)),
                                    ]
                                    )
                                )
                              ]
                          ),
                          Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Container(
                                    child: Icon(
                                      Icons.arrow_forward_ios_sharp, size: 8.w,
                                      color: Colors.black54,),
                                  ),
                                )
                              ]
                          )
                        ]
                    ),
                  ),
                ),
                FlatButton(
                  height: (MediaQuery
                      .of(context)
                      .size
                      .height - MediaQuery
                      .of(context)
                      .padding
                      .top) * 0.15,
                  color: Color(0xffE4EDFF),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Test_Main()),);
                  },
                  child: Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 30),
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Color(0xff4573CB),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(40)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.8),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: Offset(
                                      2, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Center(
                                child: Text('복습\n시험', style: TextStyle(
                                    fontSize: 14.sp + size,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))
                            ),
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 50),
                                    child: Column(children: <Widget>[
                                      Text('학습하기', style: TextStyle(
                                          fontSize: 14.sp + size,
                                          color: Colors.black87)),
                                      Text('', style: TextStyle(
                                        fontSize: 1.sp,)),
                                      Text('배운 내용을 복습', style: TextStyle(
                                          fontSize: 11.sp + size,
                                          color: Colors.black54)),
                                    ]
                                    )
                                )
                              ]
                          ),
                          Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Container(
                                    child: Icon(
                                      Icons.arrow_forward_ios_sharp, size: 8.w,
                                      color: Colors.black54,),
                                  ),
                                )
                              ]
                          )
                        ]
                    ),
                  ),
                ),
                SizedBox(height: 0.5.h)
              ],
            ),
          ),
        ),

        appBar: AppBar(

            title:
            Text('구구절절', style: TextStyle(color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold)),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 3.0,
            automaticallyImplyLeading: false,
            iconTheme: IconThemeData(color: Colors.blue),
            //leading:
            actions: <Widget>[


              Semantics(
                label: "",

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Container(
                      padding: EdgeInsets.only(right: 25, bottom: 5),
                      alignment: Alignment.center,
                      child: IconButton(
                          padding: EdgeInsets.all(0),
                          constraints: BoxConstraints(),
                          icon: Reading
                              ? Icon(
                              Icons.email_outlined, color: Colors.blueAccent,
                              size: 35)
                              : Icon(
                              Icons.mark_email_unread, color: Colors.blueAccent,
                              size: 35),
                          onPressed: () async {
                            SharedPreferences s = await SharedPreferences
                                .getInstance();
                            await Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>
                                    Notific(
                                    )),);
                            setState(() {
                              s.setBool("reading11", true);
                              Reading = s.getBool("reading11")!;
                            }
                            );
                            //onPageChanged: _questionController.updateTheQnNum,
                          }
                      ),
                    ),

                    SizedBox(height: 0.5.h,),
                    Padding(
                      padding: EdgeInsets.only(right: 15,),
                      child: Text("공지사항",
                        style: TextStyle(fontSize: 6.sp, color: Colors.black),
                        textAlign: TextAlign.center,),
                    )
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }

  Future<bool> onWillPop() async {
    DateTime currentTime = DateTime.now();

    //Statement 1 Or statement2
    bool backButton = currentBackPressTime == null ||
        currentTime.difference(currentBackPressTime!) > Duration(seconds: 3);

    if (backButton) {
      currentBackPressTime = currentTime;
      Fluttertoast.showToast(
          msg: "뒤로 버튼을 한 번 더 누르시면 종료됩니다.",
          backgroundColor: Colors.black,
          textColor: Colors.white);
      return false;
    }
    return true;
    SystemNavigator.pop();
  }
}