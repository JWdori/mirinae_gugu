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
  'CO3FPEFMgSY',
  '_1IqZ0a1w6Q',
  'wHC8fQGzvuU',
  '2Bo5LyY406U',
  'sdbQVf0Jb2Y',
  'xoJjygXPAM8',
  'C6XuO8c3cM0',
  'dYPGg4vrfQA',
  'vtK-tJ3B2Pg',
  'pE6kDF3JxCE',
  'V8M9NuYHvjE',
  'j9E2vvnKCrQ',
  'oblTvOMVEVA',
  'gsiA3lVLadI',
  '-ZHdyR3IRWY',
  'YWZwKnr4nCw',
  '1McPMrw0GDA',
  'xq9-Eg5-v8E',
  'BToZYVSa4kE',
  '0NCOjRF_Vf4',
  'TYbB54svwII',
  'AM-dhRYH0og',
  'SUBV6FhK5RU',
  'auOIVn4RAL8',
  'STXofRkBtZc',
  '4C_NvoU2x1s',
  'Po8kQ6V22Vo',
  'MVdo945kl0Y',
  'yA3uyrvReM0',
  'EsnpgQjApyo'
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
