
import 'package:flutter/material.dart';

class tutorial extends StatefulWidget{
  @override
  _Setting createState() => _Setting();
}

class _Setting extends State<tutorial> {
  @override
  Widget build(BuildContext context) {
    return aa("튜토리얼");
  }


  aa(String title) {
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 10),
            Text("이메일 주소\njaewan0114@naver.com"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("예", style: TextStyle(color: Colors.black),),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("아니요", style: TextStyle(color: Colors.black),),
          ),
        ],
      );
    });
  }
}