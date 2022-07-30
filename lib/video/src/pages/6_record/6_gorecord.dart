import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '6_Record.dart';


class GoRecord extends StatefulWidget {
  @override
  _GoRecordState createState() => _GoRecordState();
}

class _GoRecordState extends State<GoRecord> {
  var audioPath;
  var directory;
  late List<String>? records;
  late Directory? appDir;
  @override
  void initState() {
    super.initState();
    records = [];
    getExternalStorageDirectory().then((value) {
      appDir = value!;
      Directory appDirec = Directory("${appDir!.path}/Audiorecords/");
      appDir = appDirec;
      appDir!.list().listen((onData) {
        records!.add(onData.path);
      }).onDone(() {
        records = records!.reversed.toList();
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    appDir = null;
    records = null;
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Record(records: records);
  }
}