import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class video_page extends StatefulWidget {
  const video_page({
    Key ?key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  _5_video_page createState() => _5_video_page();
}
class _5_video_page extends State<video_page>{

  late final YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(

      initialVideoId: asd[widget.id-1],

      flags: YoutubePlayerFlags(
        hideThumbnail: true,
        //isLive: true,
        autoPlay: false,
        controlsVisibleAtStart: false,
        useHybridComposition: false,
      ),
    );
  }

  List asd = [
    'zw62YLjBFeY',
    'BkQpD1ScDZA',
    '3-ntPQTYFVU',
    'WO9Xuut6S7Q',
    'Z3997bs2C20',
    'I-XAwCLZyxo',
    'mCn4K_LH0-4',
    'rk11WlXde4Y',
    'G49Mf-kvatQ',
    'q7t4AlGLv1Y',
    'jx0hAENgpLw',
    'MbWzPyTAHXs',
    'hvwGBYDCzBY',
    'NJ2zAFiequU',
    'XUWZZsoJUbA',
    'QXV3ppbOBng',
    'D4pJwrhaT2o',
    '-WgTLbaW2tU',
    'lmQuF5fZ3i0',
    'Tq50kMrxduo',
    'SStt52E_2W8',
    'IPlheDfQj78',
    'tI9z3qpbtr4',
    '7CLIrQ1X3ls',
    'I1PKfLRIkTU',
    'wMWO8o9XLKg',
    'x-OLqomymic',
    'UaGxCqdLnrE',
    '89zSpYkwdAg',
    'RUR41q7CTzE'


  ];

  @override
  void dispose() {

    _controller.dispose();
    super.dispose();
  }

  Widget youtube(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      liveUIColor: Colors.amber,
    );
  }

  @override
  Widget build(BuildContext context) {
    var height2 = AppBar().preferredSize.height;
    return Container(
      child:
      Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: MediaQuery.of(context).size.width/(30/(30-widget.id)),), //상단 슬라이드
            child: Container(
              height: (MediaQuery.of(context).size.height - height2 - MediaQuery.of(context).padding.top) * 0.01,
              color: Colors.blue.withOpacity(0.6),
            ),
          ),

          //상단 슬라이드 밑에 선
          Padding(
            padding: EdgeInsets.only(bottom:(MediaQuery.of(context).size.height - height2 - MediaQuery.of(context).padding.top) * 0.001,), //상단 슬라이드 밑에 선
            child: Container(
              height: (MediaQuery.of(context).size.height - height2 - MediaQuery.of(context).padding.top) * 0.001,
              color: Colors.grey.withOpacity(0.3),
            ),
          ),
          Container(
              height: (MediaQuery.of(context).size.height - height2 - MediaQuery.of(context).padding.top) * 0.31,
              child: Semantics(
                  label: "유튜브 영상",
                  child: youtube(context)
              ))
        ],
      ),
    );
  }
}
