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
    'DE2BJbFxvZM',
    'TKfKTkUB1xU',
    'XQBUflucG8g',
    'Fc8igWPEML8',
    '4RRhwxoC8t8',
    'TO54rirsKQM',
    'Z74KBLKlJmY',
    'K1XAyLlhX_4',
    '7QLiCWrI_14',
    'QZrYT5Po8Ac',
    '-71ZIeiGrsc',
    '8VZw4k2gb-I',
    'KQ50aXexVK8',
    'o6IgcTH4zcE',
    't-WG6MtzOV8',
    'uWDN8jarZeM',
    '-3nqh47IpeA',
    'riJFj9FHi8k',
    'OIZj06tDg2g',
    'zGfykm0Ka_s',
    '95W2zKk9hg0',
    '_ZDVQAcszOU',
    'vkWNjaTlp-c',
    'AVLfu3rRHRc',
    'bn-o94Mf8B0',
    'A3sLzUaJarw',
    'TyoR9cGI9jA',
    'fPTGfA-y3lc',
    'X8RcKZD8560',
    '3VgqJPUcOTk'

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
