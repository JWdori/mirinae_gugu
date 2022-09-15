import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class video_page_man extends StatefulWidget {
  const video_page_man({
    Key ?key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
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
    'Ch8HtyEYp4Q',
    'bGfPNMTGWjI',
    'GYpCLZiJivs',
    'lgqkaUBRsTk',
    'O2U0gVtJ85I',
    '4Bx6b7cFSK0',
    '0m5h5emPdHg',
    'YIyQe2E_eXQ',
    'K5CH1ANNJKc',
    '5zgw-qKO-a8',
    'o7SIVQsZMeU',
    'gCQqglebagI',
    '6G0KiuyTv88',
    'UFhX92cGiHQ',
    'fjZ6S3qPNe4',
    'Cb3XKcepEj8',
    'sVIyOGAQ29w',
    'FIpDTZjafBo',
    'UDViscN6F3U',
    '2S70m1nDSpc',
    '2pG4GBcan1o',
    'OZLLqqLeg7M',
    'bBsAF-5PX0M',
    '4T3tiuSNvX8',
    'ALbSHgw5Qk0',
    'nubJW8UiX6s',
    'Afjeml6CLS0',
    '481MudW8who',
    'hdsQpMQSMUw',
    'UeEeBGhZIFE'

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
