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
    's_TZ-Mkf1bk',
    'rEKg95MC1JU',
    '-5Lc4GsZAac',
    'h8sVtovlIzw',
    '1eBMuBjtu0E',
    '35t6kgkA_wA',
    'aWMpEdTRGxU',
    'tlc4Kba7UXU',
    'B83VmH8jsnQ',
    'o1YTtYvSmcU',
    'Xt92wHNmNCY',
    't83JhASX15g',
    '4a8LpiKXKrc',
    'ZDRTZDuEQQw',
    'bI6Fjsda_nU',
    'mDCPH5f1lHU',
    '6wDoATuRJas',
    'KM_ruSc9xRs',
    'PtdL_mE73Ig',
    'Pwrgv1ahcY4',
    '7RrIFO7w9Co',
    'MXht9bbphDI',
    '4XohoOwd9cI',
    'heGB-rFSWi0',
    'ITZRyp80Mvo',
    'OGndUvVqS-8',
    'FMe8sxLEABw',
    'A4EXfmEU_1Q',
    'ZeSr3ck4zrk',
    'UJY9hQ4xcVA'
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