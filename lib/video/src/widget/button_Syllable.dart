import 'package:flutter/material.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonSyllable extends StatelessWidget {
  ButtonSyllable({
    Key ?key,
    required this.onTap,  required this.text,
  }) : super(key: key);

  final String text;
  var onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.0.w,
      height: 50.0.w,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          side: BorderSide(color: Colors.black),
        ),
        onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) => onTap));},
        child: Text(text,textAlign:TextAlign.center, style: TextStyle(fontSize: 30.sp+size,color:Colors.black,fontWeight: FontWeight.bold)),
      ),
    );
  }
}