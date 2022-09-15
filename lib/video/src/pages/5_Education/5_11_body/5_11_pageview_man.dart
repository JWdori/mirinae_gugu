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
    'h3HRGaUp_Xs',
    'VJgp5eLcl48',
    'V4329Afyaus',
    'hQWioNu9lQ0',
    'zsT7zA1TrBQ',
    'f0nUtnKzry4',
    'r3QaehtGKuI',
    '0Fy4tuD4HPw',
    'qh2ZnTDOVaU',
    '2n0_HK_w6BM',
    '1c3ESpPVSVg',
    'Nz0wK-s0FBs',
    'ewijTVngAKE',
    '1o7mpcjvNzw',
    'uzG0px-sOvE',
    'n3SPWLQZVvA',
    'q7S6NObo0jA',
    'aF9-pol3FG0',
    'KDZW6XtW2jE',
    'F5F4eab6iuA',
    'gYvSTfj55b4',
    'DjxPdruVdeQ',
    '2jXfSlN8_Cs',
    'QaPtS1KQLgk',
    'aGuTzjBXV84',
    'pMm2twe40yU',
    '5Ftohq4fhiQ',
    'Ar-frbquATY',
    'ceWdv-flxB4',
    'BaiPvmbDt0k'

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
