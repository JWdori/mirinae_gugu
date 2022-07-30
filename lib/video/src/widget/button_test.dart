import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';


class TestButton extends StatelessWidget {
  TestButton({
    Key ?key,
    required this.onTap, required this.icon, required this.text,required this.color, required this.state
  }) : super(key: key);

  final String text;
  var onTap;
  var icon;
  final color;
  bool state;

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(5),
        child:
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
          color: state ? Colors.grey : Color(0xff7ba6f9),
          height: 80.h,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => onTap));
          },
          child: Semantics(
    label: state ? "완료된" : "미완료된",
    child: Column(children: [
      Icon(state ? Icons.check_sharp : icon, color: Colors.white,),
            Text(text, style: TextStyle(fontSize:14.sp+size,color: Colors.white),)
          ],),
        ))
      );
  }
}