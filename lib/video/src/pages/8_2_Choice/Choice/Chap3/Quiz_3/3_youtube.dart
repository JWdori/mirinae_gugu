import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap3/Quiz_3/3_option.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap3/Quiz_3/3_quiz_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mirinae_gugu/video/src/components/Questions/Question.dart';

class ayotube_3 extends StatefulWidget {
  const ayotube_3({
    Key ?key,
    required this.question,required this.id,
  }) : super(key: key);

  final Question question;
  final int id;

  @override
  _ayotube_3 createState() => _ayotube_3();
}
  class _ayotube_3 extends State<ayotube_3>{
    late final YoutubePlayerController _controller;
    @override
    void initState() {
      super.initState();
      _controller = YoutubePlayerController(
        initialVideoId: asd[widget.id],
        flags: YoutubePlayerFlags(
          hideThumbnail: true,
          //isLive: true,
          autoPlay: false,
          controlsVisibleAtStart: false,
          useHybridComposition: false,
        ),
      );
    }

    List asd = ['0',
    'BmZt9vLB00k',
    'I9SWfD9S9WQ',
    'pwlxTCGH2A0',
    'spFXwZDWzPI',
    'uS6PS8AFhh4',
    'PEaV6jw1l7w',
    'HsGbxDSQR2s',
    'q3993NxjA3s',
    'NMdB5J7DiIo',
    'fLlXt4T4_jg'];

    @override
    void dispose() {

      _controller.dispose();
      super.dispose();
    }

    Widget youtube(BuildContext context) {
      return YoutubePlayer(
        controller: _controller,
        liveUIColor: Colors.amber,
//테두리
      );
    }

  @override
  Widget build(BuildContext context) {
    var height2 = AppBar().preferredSize.height.h;
    QuestionController_33 _controller = Get.put(QuestionController_33());
    return Container(
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(left: 20,right: 20),
            height: (MediaQuery.of(context).size.height - height2 - MediaQuery.of(context).padding.top) * 0.31.h,
              child: youtube(context),
          ),
          SizedBox(height: 20.h),
          Text("영상 속 단어를 골라주세요", style: TextStyle(fontSize:20.sp+size, fontWeight: FontWeight.bold, color: Colors.black)),//번째 문제 표
          SizedBox(height: 20.h),
          ...List.generate(
            widget.question.options.length,
                (index) => Option(
              index: index,
              text: widget.question.options[index],
              press: () => _controller.checkAns(widget.question, index),
            ),
          ),
        ],
      ),
    );
  }
}
