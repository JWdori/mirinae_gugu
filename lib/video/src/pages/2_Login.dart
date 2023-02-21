
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mirinae_gugu/video/src/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mirinae_gugu/video/src/binding/initBinding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '1_Loading.dart';

class Login extends StatelessWidget{
  const Login({Key? key}) : super(key: key);

  void load() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    select = prefs.getInt('fontchoose')!;
  }

@override
  Widget build(BuildContext context){
    String? Q;
    if (select==1){
      Q = "origin";
    }
    else if(select ==2){
      Q = "cookie";
    }
    else if(select ==3){
      Q = "chosun100";
    }
    else if(select ==4){
      Q = "nexon";
    }
    else if(select ==5){
      Q ="nunum";
    }
    WidgetsFlutterBinding.ensureInitialized();

    load();

    return ScreenUtilInit(
        designSize: Size(411.4, 866.3),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_,child) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: '구구절절',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: TextTheme(button: TextStyle(fontSize: 45.sp)),
            brightness: Brightness.light,
            fontFamily: Q,
            primaryColor: Colors.white,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),

            initialBinding: InitBinding(),
            initialRoute: "/",
            getPages: [
              GetPage(name: '/', page: ()=>App())


            ],

          builder: (context, widget) {
            return MediaQuery(
              //Setting font does not change with system font size
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget,
            );
  }





        )

  );
}
}

