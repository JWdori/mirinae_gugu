import 'package:flutter/material.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';

class Dumybutton extends StatelessWidget {
  Dumybutton({
    Key ?key,




  }) : super(key: key);

  final double width = 80.0;
  final double height = 80.0;
  final double borderRadius = 50.0;

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
      onTap: (){},
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
              color: Colors.white.withOpacity(0),
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                width: 0.3,
                color: Colors.white.withOpacity(0),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10.0,
                  offset: Offset(5.0, 5.0),
                  color: Colors.white.withOpacity(0),
                ),
              ],
              gradient: gradient,
            ),
            width: width,
            height: height,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0),
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(
                  width: 0.3,
                  color: Colors.white.withOpacity(0),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1.0,
                    offset: Offset(1.0, 1.5),
                    color: Colors.white.withOpacity(0),
                  ),
                ],
                gradient: gradient,
              ),
              child: Center(
                child: Text(
                  '',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0),
                      fontSize: 20.0+size, fontWeight: FontWeight.bold,
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