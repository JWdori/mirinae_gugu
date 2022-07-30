import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mirinae_gugu/video/src/components/DefaultAppBar.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';

class NotificationPage extends StatefulWidget {
  final String title;
  final String content;
  final String date;

  NotificationPage({Key ?key, required this.title, required this.content, required this.date}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(title: '공지사항',),
      body: FittedBox(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(16.0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [BoxShadow(color: Color(0xFF808080), blurRadius: 2.0)]),
          child: Semantics(
            label: "공지사항 내용",
          child: Column(
            children: [
              Text(widget.title,
                  style: TextStyle(fontSize: 20.0.sp+size, color: Color(0xFF303030))
              ),
              SizedBox(height: 16.0.h),
              //Image(image: AssetImage(manShoes)),
              //SizedBox(height: 16.0),
              Text(widget.content,
                  style: TextStyle(fontSize: 16.0.sp+size, color: Color(0xFF808080))),
              SizedBox(height: 16.0.h),
              Align(
                alignment: Alignment.centerRight,
                child: Text(widget.date,
                    style: TextStyle(fontSize: 16.0.sp+size, color: Color(0xFF808080))),
              )
            ],
          ),
        ),)
      ),
    );
  }
}