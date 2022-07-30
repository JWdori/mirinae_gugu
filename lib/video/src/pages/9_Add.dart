import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirinae_gugu/video/src/app.dart';
//

class Add extends StatelessWidget {
  // Global Key of Scaffold
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Center(
          child: RaisedButton(
            onPressed: () {
              showAlertDialog(context);
            },
            child: Text("Show AlertDialog"),
          )
      ),
    );
  }

  void showAlertDialog(BuildContext context) async {
    String result = await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('개발자 정보'),
          content: Text("손승아\n이지현\n임재완"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context, "OK");
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}