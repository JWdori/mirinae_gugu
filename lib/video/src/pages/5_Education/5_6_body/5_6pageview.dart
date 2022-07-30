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
    'Mk5Cdm47m8c',
    'LaLjxuZbSos',
    'SIYdECcn9fQ',
    'Sjd7t-j19U0',
    '2dD9hHc_cWc',
    'JnqvKbfwQrY',
    'vpvCbDur-Ko',
    'E2RRpUGkSg0',
    'v_djaZZN_LE',
    'haxaoWM0KdM',
    //10
    '5Tlz3euU3Gs',
    'YcUc_kyT524',
    'O0bgoaaw5oo',
    '4QE1neTWUFo',
    'Qw4aLyaLqSE',
    'BD8Lun_P1Z4',
    'IB2pLeAsOWU',
    'M4R8ZtAEVBE',
    'SLsgZ-agKeY',
    'QaxOQ3aq7Vw',
    //20
    'r81Wbgg5tmw',
    'Y7vjgJVgTi4',
    'gYB2iW-Bc_Y',
    'DCZbEei2rwQ',
    '9UgT-Gk9_WU',
    'CdQs3UaUkYE',
    'FuO6TSCUmtA',
    'VP9--P55a1M',
    '9lb0cnmmaMs',
    'bLta46dgV6o'
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
