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
  'SKKB9XBx3JQ',
  'c_wGxoHa0ew',
  '-UUiTQKyAmQ',
  'YkemiBQHj2Y',
  'PL-gbbZDwYU',
  'sbkRKgj_UNM',
  'CxZNh_KR6fk',
  'RnQIXdDlLoM',
  'X1coPJL_9KQ',
  'Yy-Dh7EnI6s',
  '1xxK9v9i0RU',
  'szzftzqdbbE',
  'AEsZHKd6DKA',
  'sgdBQUAZMJ0',
  'HVSJ9xIu3rc',
  'PICDs1pM5b0',
  '2T_rCklamvg',
  'CayD8CfLvE4',
  'tJfUiukF_OU',
  'JL-eG4ghHW4',
  'yRqws304GoQ',
  'vgTFjlX4NwU',
  'EE6jUbS6CBE',
  '-Ri8FUjxWBA',
  '9a7j3S-rRCU',
  'BHpO-r7fMCg',
  'OPPZx5ZYGa8',
  'ul0bCtoidJw',
  '1Gl1B3oCZ8M',
  'Mo1M6KVEL5k'
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
