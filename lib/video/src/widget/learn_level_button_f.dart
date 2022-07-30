import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LearnLevelButton extends StatelessWidget {
  LearnLevelButton({
    Key ?key,
    this.text = '',
    required this.onTap, required this.state
  }) : super(key: key);

  final bool state;
  final String text;
  final VoidCallback onTap;
  final double borderRadius = 50.0;
  final double width = 80.0.w;
  final double height = 80.0.h;

  @override
  Widget build(BuildContext context) {
    var gradient = LinearGradient(
      begin: Alignment.topCenter, // new
      end: Alignment.bottomCenter, // new
      colors: [
        //Color(0xff9cbbf6),
        //Color(0xff9cbbf6),linkwell

        //Color(0xff7ba6f9),
        state ?Colors.grey : Color(0xff7ba6f9),
        state ?Colors.grey: Color(0xff7ba6f9),
      ],

    );


    return Semantics(
      label: state ? "완료된" : "미완료된",
      child: InkWell(
      onTap: onTap,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            bottom: 20.0,
          ),
          child: Container(
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(borderRadius),

              border: Border.all(
                width: 0.3.w,
                color: Colors.black26,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10.0,
                  offset: Offset(5.0, 5.0),
                  color: Color.fromRGBO(0, 0, 0, 0.2),

                ),
              ],
              gradient: gradient,
            ),
            width: width,
            height: height,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(
                  width: 0.3.w,
                  color: Colors.black26,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 0.5,
                    offset: Offset(1.0, 1.5),
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                  ),
                ],
                gradient: gradient,
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0.sp, fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}