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
    'aYulRnLnS80',
    'z_Nsplsxga0',
    '536LvBLULmw',
    'wOh5HjZ6iAM',
    'qB6YhWu48jk',
    'ebs4alKF_pk',
    'pA4xXJx4qT0',
    '36H7na9YfYc',
    'CvZW2Iq3z1s',
    'jv1Hyd3v834',
    'e17qOcGR0VA',
    'X5u7yF8g78I',
    'EZQ0nFNi_4M',
    '0y30zTR2Pt4',
    'BYCTFcq-WtQ',
    'Rk0fbymVnQ8',
    'L6BMm1orM90',
    '0IjJP-79svk',
    '-nsef2L1Qlg',
    'WN0dtRG6be4',
    '9FXneOxl-Z0',
    'fwfgCTJiA_w',
    'oTz-q2INyek',
    'HnAfTVljyz8',
    'Yh_Y0HXJ3J0',
    'uXGbnJAPxdQ',
    '6eW5bRxsvto'

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
