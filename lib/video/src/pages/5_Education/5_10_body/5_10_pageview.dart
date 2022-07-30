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
    '2CUbg2fgYKI',
    'CE8KZmKRdKo',
    '040zEHfAua8',
    '3lWFW75b5Ok',
    'Eg1IsEtDrVQ',
    'gA0--98j9BQ',
    'mjnt0Bj4iUA',
    'JYqpKjNPQ4c',
    'CojD115ZVpw',
    '2fC1WuwRKxE',
    '-6axnvNLKxg',
    'D7RXQFyyMpg',
    'OW_lHQX2CVk',
    'KjKcbXOQScw',
    'Q3KY6_3NaSk',
    'GuAQpbW9f5Q',
    'LQHZgz6CZwM',
    '-hf0V_BCKOI',
    'jWAS5ozkE9Q',
    '-JXoyigwD3c',
    'u3a9VidPk-0',
    'nnhc3Ncce68',
    '1OYQJm0ASFI',
    'W3tC2qq3fPQ',
    'SK7C3hl_GZE',
    'wzPJJuJQ7NY',
    'QFaawgkzDXk',
    'VSIegRxTmuE',
    'z8h6U0BRlG8'
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
