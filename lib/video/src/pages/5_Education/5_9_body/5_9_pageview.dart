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
  'lhcNNfJJx_4',
  'Uj3Pw1uV0Hk',
  'w3rzQw_2FWk',
  'n9zKw12Nw3s',
  'ar1KkYJfkhI',
  'ONQSGCW5dtw',
  'acZCXKpwn6o',
  'uXDcbylQ7uc',
  'wDBELdts4HU',
  'TqwHaab2gH8',
  'GjJ-deig8I0',
  'LclZPP6biF8',
  '_fbbR-xihpI',
  'llO_AmsGYfY',
  'QBBToOG6l8k',
  'byBuyyz5OmE',
  'VemJHyeIgwk',
  'SRX2w9hCxGE',
  'UPh0AiZ7yY0',
  'RlFJuNJQrdY',
  '_zpJOCLYTVg',
  'C5s0oWGR2ho',
  'rPiW2Wq_WeQ',
  'iToISbtyyjs',
  'd3jYU6QCz-w',
  'VElcUxKBlwM',
  'QoKgrRhNqDk',
  'hErak5NR_VU',
  'Ny3yVXis-ig',
  'jj623b4BQhY'

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
