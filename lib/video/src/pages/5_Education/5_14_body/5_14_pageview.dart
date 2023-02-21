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
    'vxKZCjvTN7s',
    'MOhijAIabE8',
    'AzR8JibFfaI',
    '3xpCujChBRU',
    'iRVlsarIAkg',
    'M9Jswm_mUr4',
    'zI6Vudvdz2Q',
    'FnSO5XuzoZk',
    '90DaHRxEGPk',
    'toFczgH9WdQ',
    '_FCRrUA5x2s',
    'q-PUWSiHt5I',
    'H-vl78O1obQ',
    'x1aDcXMXd4g',
    'EVPDSojsu7k',
    'QWSCwLJAdK4',
    'EqE64QLy5Cw',
    'hJl87Fcz5u0',
    '6nXFB1XdcHU',
    'aJiOutCktiY',
    'ermaKt_XUys',
    'Gt1MI_N3a5w',
    'qZaZ3BO1pLU',
    'IkaaM23Kw40',
    '7grVpMDR_eE',
    'h5K5OYH8DaM',
    'Guxj9WYw94E',
    'BSp15aYoXuc',
    'mjikbnS-SdE',
    '1FvDhRxzjSw'
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
