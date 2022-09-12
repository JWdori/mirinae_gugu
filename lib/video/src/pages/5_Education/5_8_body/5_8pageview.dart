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
    'MwyipytuVpk',
    'Z--BToDN6-s',
    'AoOStc8TF9k',
    'TtHqSL3IHNw',
    'EpwKZhzZLOw',
    'glGLHr_t5WI',
    'ofcowbROxoI',
    'xWiMFcoA_vQ',
    'UkEetWKxtwI',
    'QeuVrjn_Dqg',
    'Ec7sq0ubgBw',
    'Dnb0z70SZGY',
    'Mh_KCX9OXNk',
    'PLg12zTGrWo',
    'tbN5Q-_II6A',
    'JB6Fvp9u2us',
    'B_cHrG320P4',
    'L7kVRSSTbBY',
    'IyOp9VdLS2g',
    'GFaZAaKTR9I',
    'VDyjdL7BwYI',
    'DUmIPBP8VRU',
    '4y95m15iZjE',
    'M0sxEbPoH-0',
    'Blf-rn8LFVM',
    'P7RdkTfhV9s',
    'WAv1n1Dztsc'

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
            padding: EdgeInsets.only(right: MediaQuery.of(context).size.width/(27/(27-widget.id)),), //상단 슬라이드
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
