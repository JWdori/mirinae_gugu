import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class video_page_man extends StatefulWidget {
  const video_page_man({
    Key ?key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  _5_video_page createState() => _5_video_page();
}
class _5_video_page extends State<video_page_man>{

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
    'xgP5beHRxPE',
    'AreLyfFgWMM',
    'ASGO__lj29s',
    'cbv2P13KWEU',
    'Ley5msQEctQ',
    'AKu8YFTAzZo',
    'mYxmTyNHmFw',
    '3oWtlJxPt0E',
    "없음",
    "HLog9MZsdO0",
    "KoJ6bk9D2vw",
    "zde2UbfK56c",
    "f86vffxL2Ic",
    "KXu0am95kqc",
    "pdMZVQ1EGcQ",
    "tWVxFKYdLvw",
    "없음",
    "FdIJ4zL0Foo",
    "CIAN_Q3BXRU",
    "gnc6e5tlhRA",
    "xfiFtYE8CCE",
    "없음",
    "floSiepFIMk",
    "UoTIXvnyzO4",
    "dTqpUu9bKn8",
    "TFLyzOKpwTw",
    "O6ImOAXC1VY",
    "nkNNmaI0EhA",
    "u-gNoyk21VU",
    "3tJqPfdYIVM"

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
