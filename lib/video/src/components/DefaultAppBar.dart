import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final action;
  const DefaultAppBar({
    Key? key, required this.title, this.action,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(color: Colors.black,fontSize: 24.sp,fontWeight: FontWeight.bold)),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 3.0,
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(color: Colors.blue),
      leading: Semantics(
      label: "이전 페이지로 이동",
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () => {Navigator.of(context).pop()},
      ),
      ),
      actions: action,

    );
  }
}