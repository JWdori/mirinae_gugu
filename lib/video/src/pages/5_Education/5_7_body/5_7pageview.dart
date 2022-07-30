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
    'wV4lK1XleII',
    'dG7cbx5Vd6s',
    '55J-sI02P7A',
    '_A5jd2gmHo4',
    's00LuKP1ZrM',
    'HyK3Zf8Xlkk',
    '5K6CSXykZhk',
    'jB6OE26NeD0',
    'xzprt2edVDU',
    '2eEsvSFTld8',
    //10
    'SbL7GSZiIUw',
    'CJX25MIRAoY',
    'Ei9NRkqYWlg',
    'Z2Uwc5HmtAE',
    'bsuhLKOZ8jA',
    'q4VT9ayFMio',
    'M17A8FpvxXo',
    'qZf_3bubXkE',
    'ZD2H8Vc_pOo',
    'QFdyHapDz4k',
    //20
    'T6OM7f5uKbo',
    'JMV9ZKWnBRY',
    'hmH5dXD2MEw',
    '1qwKVWYAbLY',
    'WvX0fg5kJYc',

    'VNiQ-dqLNQc',
    'H1wUJNCQT7A',
    'tAQbb3pon3E',
    'rr8sQTt4mHM',
    'ucBAdPElj2I'
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
