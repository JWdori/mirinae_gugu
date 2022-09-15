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
    'dQq2fub2GD8',
    'n07VTP-jRRs',
    'a_41sYTNFms',
    '0sI_lGH7oi0',
    '/Fprhk9ZLwQs',
    'WL2k-JV_Q60',
    'LJNqTMs2wmY',
    '7tRndLvmo40',
    'NAp26nGRSJk',
    'nRKEb2UvJhc',
    'E6xTJWS7gWg',
    'KHd8DqpFzog',
    'sWmYPuSFlmI',
    'vS4u9MqVdC4',
    'wor1d7fVLm8',
    'Z7Mq7GRUIUs',
    'gjtu43TUBUU',
    'wIh3dWIc6EY',
    'BWT0M1KJo08',
    'v1Z83UIw8Ws',
    'TeLwPQC1ddw',
    'QGMPpTqVvmQ',
    '69GsN1qQYBw',
    '6XepJ2bHGKQ',
    't51GLw7jvQ8',
    'svuLB9c8o-4',
    'Q-riJ8xPQqc',
    'MfFh0ct0dN8',
    'HSX2_wIUVpg',
    '/h25o9F53JcE'

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
