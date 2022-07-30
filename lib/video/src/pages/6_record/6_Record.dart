import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';

class Record extends StatefulWidget {
  final records;
  const Record({
    Key? key,
    required this.records,
  }) : super(key: key);

  @override
  _RecordState createState() => _RecordState();
}

class _RecordState extends State<Record> {

  @override
  void initState() {
    super.initState();
  }

  late int _totalTime;
  late int _currentTime;
  double _percent = 0.0;
  int _selected = -1;
  bool isPlay=false;
  AudioPlayer advancedPlayer = AudioPlayer();

  int? oneopen;
  Duration currentTime = Duration();
  Duration totalTime = Duration(seconds: 1);


  @override
  void dispose() {
    advancedPlayer.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("녹음 목록",style: TextStyle(fontSize: 24.sp,color: Colors.black,fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        centerTitle: true,

      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        alignment: Alignment.topCenter,
        child: ListView.builder(
          key: Key('builder ${oneopen.toString()}'),
          itemCount: widget.records!.length,
          shrinkWrap: true,
          reverse: false,

          itemBuilder: (BuildContext context, int i) {
            return Card(
                elevation: 3,
                margin: EdgeInsets.symmetric(vertical: 7, horizontal: 0),
                shape: RoundedRectangleBorder(
                    side:  BorderSide(color: Colors.black,width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(9))
                ),
                child:Semantics(
                  label: "녹음 ${i+1}",
                  child: ExpansionTile(
                    key: Key(i.toString()),
                    initiallyExpanded: i == oneopen,

                    title: Text(
                      _getTime(filePath: widget.records![i].toString()),
                      style: TextStyle(color: Colors.black,fontSize: 16.sp+size),
                    ),
                    onExpansionChanged: ((newState) {
                      if (newState) {
                        setState(() {
                          _selected = i;
                          oneopen = i;
                          advancedPlayer.stop();
                          isPlay = false;
                          _percent = 0.0;
                          _getDuration(totalTime);
                        });
                      }
                      else {
                        setState(() {
                          oneopen = -1;
                          advancedPlayer.stop();
                          isPlay = false;
                        });
                      }
                    }),
                    children: [
                      Container(
                        height: 120,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            LinearProgressIndicator(
                              minHeight: 5,
                              backgroundColor: Colors.black,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                              value: _selected == i ? _percent : 0,
                              //value: (currentTime.inMilliseconds / totalTime.inMilliseconds) * 1.0,

                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    _getDuration(currentTime),
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  Text(
                                    _getDuration(totalTime),
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                (isPlay)?
                                _Presso(
                                    label: "일시 정지",
                                    ico: Icons.pause,
                                    onPressed: () {
                                      setState(() {
                                        isPlay=false;
                                      });
                                      advancedPlayer.pause();
                                    }): _Presso(
                                    label: "재생",
                                    ico: Icons.play_arrow,
                                    onPressed: () {
                                      setState(() {
                                        isPlay=true;
                                        currentTime = new Duration(seconds: 0);
                                      });
                                      advancedPlayer.play(widget.records!.elementAt(i),
                                          isLocal: true);
                                      setState(() {});
                                      setState(() {
                                        _selected = i;
                                        _percent = 0.0;
                                      });
                                      advancedPlayer.onPlayerCompletion.listen((_) {
                                        setState(() {
                                          _percent = 0.0;
                                        });
                                      });
                                      advancedPlayer.onDurationChanged.listen((duration) {
                                        setState(() {
                                          _totalTime = duration.inMicroseconds;
                                          totalTime = duration;
                                        });
                                      });
                                      advancedPlayer.onAudioPositionChanged
                                          .listen((duration) {
                                        setState(() {
                                          _currentTime = duration.inMicroseconds;
                                          currentTime = duration;
                                          _percent = _currentTime.toDouble() /
                                              _totalTime.toDouble();
                                        });
                                      });
                                    }),

                                _Presso(
                                    label:"중지",
                                    ico: Icons.stop,
                                    onPressed: () {
                                      advancedPlayer.stop();
                                      setState(() {
                                        currentTime = new Duration();
                                        _percent = 0.0;
                                      });
                                    }),
                                _Presso(
                                    label:"녹음 삭제",
                                    ico: Icons.delete,
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                                content: SingleChildScrollView(
                                                  child: ListBody(
                                                    children: <Widget>[
                                                      Text('정말로 삭제하시겠습니까?',
                                                          style: TextStyle(
                                                            fontSize: 17,
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  FlatButton(
                                                      child: Text(
                                                          '네',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: Colors.blue
                                                          )),
                                                      onPressed: () {
                                                        Directory appDirec =
                                                        Directory(widget.records.elementAt(i));
                                                        appDirec.delete(recursive: true);
                                                        Fluttertoast.showToast(msg: "파일이 삭제되었습니다.");
                                                        setState(() {
                                                          widget.records
                                                              .remove(widget.records.elementAt(i));
                                                          advancedPlayer.stop();
                                                          _percent = 0.0;
                                                          oneopen = -1;
                                                        });
                                                        Navigator.of(context).pop();
                                                      }
                                                  ),
                                                  FlatButton(
                                                      child: Text('아니오',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: Colors.blue
                                                          )
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      }
                                                  )
                                                ]
                                            );
                                          }
                                      );
                                    }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
          },

        ),

      ),
    );
  }

  String _getTime({required String filePath}) {
    String fromPath = filePath.substring(
        filePath.lastIndexOf('/') + 1, filePath.lastIndexOf('.'));
    if (fromPath.startsWith("1", 0)) {
      DateTime dateTime =
      DateTime.fromMillisecondsSinceEpoch(int.parse(fromPath));
      String year = dateTime.year.toString();
      String month = (dateTime.month.toString().length < 2)?'0'+dateTime.month.toString():dateTime.month.toString();
      String day = (dateTime.day.toString().length < 2)?'0'+dateTime.day.toString():dateTime.day.toString();
      String hour = (dateTime.hour.toString().length < 2)?'0'+dateTime.hour.toString():dateTime.hour.toString();
      String min = (dateTime.minute.toString().length < 2)?'0'+dateTime.minute.toString():dateTime.minute.toString();
      String sec = (dateTime.second.toString().length < 2)?'0'+dateTime.second.toString():dateTime.second.toString();
      String dato = '$year년 $month월 $day일 $hour시 $min분 $sec초';
      return dato;
    } else {
      return "No Date";
    }
  }
  String _getDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  returntotal(int i) {
    setState(() {
      isPlay=true;
      currentTime = new Duration(seconds: 0);
    });
    advancedPlayer.play(widget.records!.elementAt(i),
        isLocal: true);
    setState(() {});
    setState(() {
    });
    advancedPlayer.onPlayerCompletion.listen((_) {
      setState(() {
      });
    });
    advancedPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _totalTime = duration.inMicroseconds;
        totalTime = duration;
      });
    });
    advancedPlayer.onAudioPositionChanged
        .listen((duration) {
      setState(() {
        _currentTime = duration.inMicroseconds;
        currentTime = duration;
      });
    });
    return totalTime;
  }


}

class _Presso extends StatelessWidget {
  final IconData ico;
  final VoidCallback onPressed;
  final String label;

  const _Presso({Key? key, required this.ico,required this.onPressed,required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 30.0,
      child: RaisedButton(
          onPressed: onPressed,
          child:
          Semantics(
              label: label,
              child: Icon(
                ico, color: Colors.white,
              ))),
    );
  }
}