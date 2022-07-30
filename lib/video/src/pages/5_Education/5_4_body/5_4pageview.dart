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
    'HSS7tDByB7I',
    'TMrY_bAsvOA',
    'sb5qvBz9fy0',
    'Gc4uBfj1DD8',
    'GR_pYa7du54',
    'Rukyu5XPCTs',
    '5np_VJl4BOI',
    'AQcZa_6ekEg',
    '1kVongZ2rKk',
    '0tEuYqNvLck',
    'MBl_uSway50',
    'x4vAAj7iMyM',
    'UMjAc_EtfS8',
    'fXQ6YoEN_fk',
    'SpT8_rf_xM4',
    '6pEfdw987Ww',
    '7hZ4ktNVfug',
    'YgLxF-CeqVE',
    't0NYG4h8ksg',
    'JwY5YWEtfwc',
    'UDDdos-_vRg',
    'JbZSU7xOeM8',
    'ViJFC8zMVrk',
    'RN71sYVdixs',
    'VKz6yrZFnm4',
    'GDVkWBI_7ps',
    'abXGCWjK7lA',
    'mUipx--8EKo'

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
