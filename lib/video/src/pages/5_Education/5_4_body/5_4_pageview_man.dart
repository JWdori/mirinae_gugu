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
    'NJq0oPGVHc0',
    'fdacnyUutzo',
    'cWNDQATEuVk',
    'VrT-j0MdftQ',
    '2KXabTeKI_0',
    'A8X5lU_AR-8',
    'hFlcaOeKSb4',
    'Y2_8VPPxGLo',
    'RyZaIWyVur4',
    'E4qWn5O42mg',
    'rU-jDxMxhXE',
    '1A7D2e__7iw',
    's7helu6rfZ0',
    'MCPATDmwvZc',
    'i1Pbyclv1mQ',
    '2FXUB7phMhc',
    '5ynfA7Pbpzo',
    'awweEeW4_fs',
    'NSdgST-UULE',
    'v5_YIL4BVqQ',
    'ctF2DCYYI-Y',
    '5NjIktjr5P8',
    'dYvx6MEfBtE',
    'RKkfYL-BuZk',
    'ezKgHB8EQII',
    'Hr21I_NCY3Y',
    'pgvlxXdbApA',
    'iTwWnB0-dYc'


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
