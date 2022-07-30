import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class video_page extends StatefulWidget {
  const video_page({
    Key ?key,
required this.id,
  }) : super(key: key);

  final int id;

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
    'ufuF6jEqzy4',
    'xXPv7WRn90s',
    'rj1AVY-Ay2w',
    'EzKF2XTgKjI',
    '0uCUZE4JEo8',
    'cLPVa3HhVPc',
    'jS765twH8NM',
    '0AbmplIPa4o',
    'UCKbGiWdVho',
    '-G5WOmWBx4g',
    'emE2FTyhIlM',
    'XCuHFzQzitM',
    'STbXfSpqRrQ',
    'ZRh-JKyJJ9U',
    'NLlko03pric',
    'Ph32BWFJp_s',
    'Q9nq-iqfPp8',
    '2VenJHUE248',
    'ntSPSoMvFuA',
    'p_NWOINU9VE',
    'rYL3adu33z0',
    'O0jup41IlP8',
    '8UB2hBKzGnY',
    '7mQnYqo-i_k',
    'y4h6S4ufI8M',
    'vQmYrdEXR8c',
    'jSD3f7qFYbY',
    'bqbrW_ZGgmY',
    '26v5T8iGU4Q'
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
            padding: EdgeInsets.only(right: MediaQuery.of(context).size.width/(29/(29-widget.id)),), //상단 슬라이드
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
