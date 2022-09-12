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
    'GVY_wju_lYc',
    '0ncoEW64ywY',
    'xAgu220PHvo',
    'nnyi34dbCd0',
    'T45wgRbGTn0',
    'tPaJRl910v0',
    '98-_PUZEXa4',
    'zS6u39Nj4Ec',
    'xUOfb17YYIs',
    'WxrFL5QDSlg',
    'VKP3XNc12SU',
    '74nfNKXkxe0',
    'YYqB85N5ivw',
    '1bcXnRi89z0',
    'rHdIKQ59V_c',
    'UYilv2gjKfY',
    '8X9OhwFJXV4',
    'ShWGtz_bgAw',
    'XdnMg8fY8UQ',
    'q5goyFduj6E',
    'NqWPR8KkyjA',
    '8u4ZWiEBjDU',
    'Cd8ibmM1OTc',
    'GM5W5CGMa2M',
    '1muYtb3GJKE',
    'a_kyvBuHB68',
    'dTvF02upHKg',
    'kdFNOAisSTQ',
    'ggTgjQUZ4ac'


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
