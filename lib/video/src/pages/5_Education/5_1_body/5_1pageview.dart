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
    'k1qGAVsgNNA',
    'W7n9Rg2zWFw',
    'dwTmk28Nrv4',
    'GEv7yyG1NUE',
    '6mS6JlQKkgA',
    'MwrKPhCSIQA',
    'gC8SURUEasA',
    'YKrfzkF0gNc',
    'z5yr8TsODVo',
    's1UUue4H9JQ',
    //10
    '54enZ6Ex1ZI',
    'lx1b6GgnUzM',
    'vdE4RDBuUkM',
    'RgJCORuftsg',
    '263ifYmXHcw',
    'DJrMIeC05V4',
    'XxyGCv8wHeI',
    '4oRBwC6cmEM',
    'U3CzyzzPNYA',
    'Ef2BUy8B14M',
    //20
    'STisOs9V3iY',
    'o8SztHFyHbo',
    '2lhgDlUDCAA',
    'dbsf8hiC8wI',
    '32LpPmZtyyw',
    'yGcdWABYpT0',
    'o193FkZPIvI',
    'pADv2YgC9js',
    'aQMPR-IJJrY',
    'D4-CnF2UXTQ'
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
