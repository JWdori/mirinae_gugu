import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mirinae_gugu/video/src/pages/10_Notification/NotificationPage.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';
bool temp = true;
Color temp_color = Colors.white;

class NotificationTiles extends StatelessWidget {
  final String title, content, date;
  final bool enable;

  const NotificationTiles({
    Key? key,
    required this.title,
    required this.content,
    required this.date,
    required this.enable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(temp){temp_color = Colors.white;}
    else{temp_color = Colors.grey;}
    return Container(
        color: Colors.white,
        child: ListTile(

          //leading: Container(color: Colors.blue, child:Text('중요')),
          title: Semantics(
          label: "제목",
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Color(0xFF303030), fontSize:18.sp+size, fontWeight: FontWeight.bold)),
              SizedBox(height: 5.h),
              Text(date, style: TextStyle(color: Colors.grey, fontSize:14.sp+size,)),
            ],
          ),),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.black,size: 15,),
          onTap: () => Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => NotificationPage(
                title: title, content: content, date: date),
            transitionDuration: Duration(seconds: 0),
          )),
          enabled: enable,
        )
    );
  }
}
