import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap2/Quiz_3/3_quiz_controller.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap2/Quiz_3/3_youtube.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Body_3 extends StatefulWidget {
  const Body_3({
    Key ?key,
  }) : super(key: key);
  @override
  _Body_3 createState() => _Body_3();
}

class _Body_3 extends State<Body_3>{

  @override
  Widget build(BuildContext context) {
    var height2 = AppBar().preferredSize.height.h;

    QuestionController_23 _questionController = Get.put(QuestionController_23());
    return Stack(
      children: [
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2),

                child: Obx(() => Text.rich(
                  TextSpan(
                    text:
                    "Question ${_questionController.questionNumber.value}",
                    style: TextStyle(fontSize: 15.sp+size, color: Colors.blue),
                    children: [
                      TextSpan(
                        text: "/${_questionController.questions.length}",
                        style: TextStyle(fontSize: 15.sp+size, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top:5), //상단 슬라이드 밑에 선
                child: Container(
                  height: (MediaQuery.of(context).size.height - height2-MediaQuery.of(context).padding.top) * 0.87.h,
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _questionController.pageController,
                    onPageChanged: _questionController.updateTheQnNum,
                    itemCount: _questionController.questions.length,
                    itemBuilder: (context, index) => ayotube_3(
                      question: _questionController.questions[index],
                      id: index+1,
                    ),
                  ),
                  //child: youtube(context),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
