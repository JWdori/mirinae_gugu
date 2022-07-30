import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap6/Quiz_1/1_quiz_controller.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap6/Quiz_1/1_option.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mirinae_gugu/video/src/components/Questions/Question.dart';

class ayotube extends StatefulWidget {
  const ayotube({
    Key ?key,
    required this.question,required this.id,
  }) : super(key: key);

  final Question question;
  final int id;

  @override
  _ayotube createState() => _ayotube();
}
  class _ayotube extends State<ayotube>{

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

    List asd = ['0', "Srl94iSJT9E",
      "HFCnoYrid7A",
      "J_TTbXsdfPM",
      "5CurCJXpvHQ",
      "FvLvfWN9fM8",
      "-2Tn0aYYq8o",
      "O1WvkHtNj4g",
      "qbMQWvD3od8",
      "hmHwYOviqFQ",
      "juxzB1SJBSY",];

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
    var height2 = AppBar().preferredSize.height;
    QuestionController_61 _controller = Get.put(QuestionController_61());
    return Container(
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              height: (MediaQuery.of(context).size.height - height2 - MediaQuery.of(context).padding.top) * 0.31,
              child: youtube(context),
          ),
          SizedBox(height: 20,),
          Text("영상 속 단어를 골라주세요", style: TextStyle(fontSize:20.sp+size, fontWeight: FontWeight.bold, color: Colors.black)),//번째 문제 표
          SizedBox(height: 20),
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
