import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:mirinae_gugu/video/src/pages/2_Login.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '6_record/6_audio_recorder.dart';


List<CameraDescription> cameras = List.empty(growable: true);//
int? select = 1;
double size = 0;
class Loading extends StatefulWidget {
  @override
  _Loading createState() => _Loading();
}

class _Loading extends State<Loading> {
  @override
  void initState() {
    super.initState();
    load();
    loadsize();

    Timer(
      Duration(seconds: 2),
          () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()),),
    );
  }
  void load() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    select = prefs.getInt('fontchoose')!;
  }
  void loadsize() async{
    SharedPreferences ss = await SharedPreferences.getInstance();
    if (ss.getString('fontsize') == "작게 (-4)") {
      size = -4;
    }
    else if (ss.getString('fontsize') == "조금 작게 (-2)") {
      size = -2;
    }
    else if (ss.getString('fontsize') == "보통") {
      size = 0;
    }
    else if (ss.getString('fontsize') == "조금 크게 (+2)") {
      size = 2;
    }
    else if (ss.getString('fontsize') == "크게 (+4)") {
      size = 4;
    }
    if (size == -4) {
      ss.setString('fontsize', "작게 (-4)");
    }
    else if (size == -2) {
      ss.setString('fontsize', "조금 작게 (-2)");
    }
    else if (size == 0) {
      ss.setString('fontsize', "보통");
    }
    else if (size ==2) {
      ss.setString('fontsize', "조금 크게 (+2)");
    }
    else if (size ==4) {
      ss.setString('fontsize', "크게 (+4)");
    }
  }
  RecordingStatus _currentStatus = RecordingStatus.Unset;
  IconData _recordIcon = Icons.mic_none;
  var status = Permission.camera.status;

  checkPermission()async{

    if (await Permission.contacts.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
    }
// You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.microphone,
      Permission.storage,
      Permission.camera
    ].request();
    print(statuses[Permission.microphone]);
    print(statuses[Permission.storage]);
    if ((statuses[Permission.microphone]==PermissionStatus.granted) && (statuses[Permission.storage]==PermissionStatus.granted) && (statuses[Permission.camera]==PermissionStatus.granted)){
      return true;
    }else if((statuses[Permission.microphone]!=PermissionStatus.granted) || (statuses[Permission.storage]!=PermissionStatus.granted) || (statuses[Permission.camera]!=PermissionStatus.granted)){
      SystemNavigator.pop();
      return false;
    }
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    checkPermission();
    print(size);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xff489bfb),

      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children:[
            Container(
              height: MediaQuery.of(context).size.width*0.5,
              width: MediaQuery.of(context).size.width*0.5,
              decoration: BoxDecoration(
                //color: Color(0xff489bfb),
                image: DecorationImage(image:AssetImage("assets/GGJJ_logo.JPG"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.2),
            Padding(
                padding: EdgeInsets.only(left : width*0.1, right: width*0.1),
                child: Text('※ 이 앱은 현대오토에버와 서울사회복지공동모금회가\n지원하는 배리어프리 앱 개발 콘테스트의 출품작입니다',style: TextStyle(color: Colors.white, fontSize: 10.sp), textAlign: TextAlign.center)
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.1),
          ],
        ),
      ),
    );
  }
}
