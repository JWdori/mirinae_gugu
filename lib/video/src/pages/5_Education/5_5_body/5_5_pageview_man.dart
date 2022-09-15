import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class video_page_man extends StatefulWidget {
  const video_page_man({
    Key ?key,
    required this.id,
  }) : super(key: key);

  final int id;

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
    'zF1i3VcAtx8',
    'WQQpvgcAcM8',
    'Sg5T7z_Dyrk',
    'rTzcvMFBB6E',
    'qWkB-Yan4bU',
    'F0vkCa95PX4',
    'F0gmLJZl4Zo',
    'b4Q04FwCLyo',
    'Ja8URm1aqxA',
    'EJU35Yi7nhU',
    'rAMkWh4lMZg',
    'xhUodQknP68',
    'w9pDogwX5nc',
    'ss59vmhWhHk',
    'AOPq68NLOq4',
    'uPhrL0tYb48',
    '-QpwlzVfiLw',
    'tGDccrCmUyM',
    'wUyEhaoY60M',
    'Cl5nrvUXsTI',
    'dN_cpiGzwQw',
    'GpkNCCbdTDU',
    'QC5aBGK-Ago',
    'q-WLzrLLbCw',
    'RM7k0EmnIUg',
    '18WDhTF1nvw',
    'FUBoS5fFYSE',
    'BRcfBXEGcwY'

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
