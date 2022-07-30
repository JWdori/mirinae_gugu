import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class update extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: CupertinoAlertDialog(
      title: Center(child: Semantics(
        label: "팝업 제목"
          ,child: Text("안내", style: TextStyle(fontSize: 24.sp),)),
      ),content:
      Semantics(
        label: "",
        child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20.h),
          Text("추후 업데이트 예정입니다 !!", style: TextStyle(fontSize: 15.sp),),
          SizedBox(height: 10.h),
        ],
      ),),

actions: <Widget>[
        Semantics(
        label: "",
        child: CupertinoDialogAction(
          onPressed: () async {
            Navigator.of(context).pop();
          },
          child: Text("이전으로", style: TextStyle(color: Colors.black,fontSize: 14.sp),),
        )),
      ],
    ));
  }
  }
