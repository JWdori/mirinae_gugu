import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirinae_gugu/video/src/controller/app_controller.dart';
import 'package:mirinae_gugu/video/src/pages/3_home.dart';
import 'package:mirinae_gugu/video/src/pages/6_record/6_gorecord.dart';
import 'package:mirinae_gugu/video/src/pages/9_setting/9_setting.dart';


class App extends GetView<AppController>{ //루트 경로로  만듦
  const App({Key? key}) : super(key: key);
  static const PrimaryColor1 = const Color(0xFF708FF8);

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: Obx(() {
          switch(RouteName.values[controller.currentIndex.value]) {
            case RouteName.Home:
              return Home();

            case RouteName.Record:
              return GoRecord();

            case RouteName.Add:
              return Setting();
          }
        }),
        bottomNavigationBar: Obx(
              ()=> BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex.value,
            showSelectedLabels: true,
            unselectedFontSize: 14,
            selectedFontSize: 16,
            backgroundColor: Colors.white,
            unselectedItemColor:Colors.grey[800] ,
            selectedItemColor: Colors.black,

            onTap: controller.changePageIndex,

            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined,color: Colors.grey[800]),
                  activeIcon: Icon(Icons.home_outlined, color: Colors.blueAccent,),
                  label : "홈"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.mic_none,color: Colors.grey[800]),
                  activeIcon: Icon(Icons.mic_none, color: Colors.blueAccent,),
                  label : "녹음 목록"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_sharp, color: Colors.grey[800],),
                  activeIcon: Icon(Icons.settings_sharp, color: Colors.blueAccent,),
                  label : "설정"),
            ],),));
  }
}
