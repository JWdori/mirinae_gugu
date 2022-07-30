import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class video_page_5 extends StatefulWidget {
  const video_page_5({
    Key ?key,
required this.id,
  }) : super(key: key);

  final int id;

  _5_video_page createState() => _5_video_page();
}
class _5_video_page extends State<video_page_5>{

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
    'jFB6uI2tHE8',
    '69ijeV0eENE',
    'g97vXm7-_fU',
    'Q9Yhg9PbkLA',
    'HtwzKRP2UCg',
    'FiAj__oc3Lo',
    '3fjZnOQz2_I',
    'BrawKgy203E',
    'Kko_lAI-H4k',
    'vkmI9WbOKIo',
    'KOZy2FgqAXo',
    'yc1TbWYXxVA',
    '3GajXvGPvNQ',
    'F83AUWeOVK8',
    'VLMrHGhzczY',
    'tEPCqk14CZs',
    'y8Q3qaT9c1k',
    'UrBAoDMwKck',
    'ycKKSRQcRbM',
    'TjBbWcgzZPA',
    'Z_ktAFvnK1g',
    'PuLgeVl4olY',
    'XMsZD_HBvq0',
    'HzTlBVT0r0s',
    '5gKewGCk39w',
    '4YY3VvCRq0w',
    '8-B_UilCkSw',
    '-YYBxODVWqI'

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
            padding: EdgeInsets.only(right: MediaQuery.of(context).size.width/(28/(28-widget.id)),), //상단 슬라이드
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
