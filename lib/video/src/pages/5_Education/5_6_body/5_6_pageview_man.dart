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
    'uNVJHaqRk-U',
    'RciAfD7sFkY',
    'jLcAwbfHKYE',
    '88CXXN0Uz7o',
    'HMT7Q5c4gak',
    'Gs3ASG38TcU',
    'ordSjsoK1d4',
    'aJpA3IRta74',
    'pPiRBtBYP4k',
    'blVgZ3o3Gxk',
    '0PkAbrnTUkk',
    'Kb5wv_rd9VU',
    'OgImWW-Uw3s',
    'toMY0zu96xY',
    'PfntO2JNTEs',
    'istnUPGDPb0',
    'cMi1fRHCv5c',
    'ARmjpDfmjpY',
    'zoAqdTcTa1Q',
    'o-bxMH9Lq84',
    'rVnGxPaTaDY',
    'cxdj4yO7pW4',
    'ZxflGjJPbT0',
    'bVZQnFZH4ls',
    'N5z8e1VrhmQ',
    '8G7gxf29WxQ',
    'ycUTK8r4gNM',
    'TqmyLGvzKkY',
    'ld0tsJeC7iY',
    'JcAj6ET_k0I'

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
