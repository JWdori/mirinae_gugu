import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';

class LearnLevelButton extends StatelessWidget {
  LearnLevelButton({
    Key ?key,
    this.text = '',
    this.width = 80.0,
    this.height = 80.0,
    this.borderRadius = 50.0,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;
  final double width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    var gradient = LinearGradient(
      begin: Alignment.topCenter, // new
      end: Alignment.bottomCenter, // new
      colors: [
        //Color(0xff9cbbf6),
        //Color(0xff9cbbf6),
        Color(0xff7ba6f9),
        Color(0xff7ba6f9),
      ],
    );

    return InkWell(
      onTap: onTap,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            bottom: 20.0,
            left: 15.0,
            right: 15.0,
          ),
          child: Container(
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                width: 0.3,
                color: Colors.black38,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10.0,
                  offset: Offset(5.0, 5.0),
                  color: Color.fromRGBO(0, 0, 0, 0.3),
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
                  width: 0.3,
                  color: Colors.black26,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1.0,
                    offset: Offset(1.0, 1.5),
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                ],
                gradient: gradient,
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0+size, fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}