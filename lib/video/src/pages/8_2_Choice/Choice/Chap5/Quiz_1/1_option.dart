import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/Choice/Chap5/Quiz_1/1_quiz_controller.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Option extends StatelessWidget {
  const Option( {
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);

  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    var height2 = AppBar().preferredSize.height.h;
    return GetBuilder<QuestionController_51>(
        init: QuestionController_51(),
        builder: (qnController) {
          Color getTheRightColor() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAns) {
                return Colors.green; //right
              } else if (index == qnController.selectedAns &&
                  qnController.selectedAns != qnController.correctAns) {
                return Colors.red; // wrong
              }
            }
            return Colors.black38;
          };
          Icon getTheRightIcon() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAns) {
                return
                  Icon(Icons.brightness_1_outlined,color: Colors.white, size: 25,);//right
              } else if (index == qnController.selectedAns &&
                  qnController.selectedAns != qnController.correctAns) {
                return Icon(Icons.clear_rounded,color: Colors.white, size: 25); // wrong
              }
            }
            return Icon(Icons.question_answer,color: Colors.transparent, size: 25);
          };

          return InkWell(
            onTap: press,
            child: Container(
              height: (MediaQuery.of(context).size.height - height2 - MediaQuery.of(context).padding.top) * 0.065.h,
              margin: EdgeInsets.only(bottom:(MediaQuery.of(context).size.height - height2 - MediaQuery.of(context).padding.top) * 0.03.h,
                  left: 40,right: 40),
              padding: EdgeInsets.all((MediaQuery.of(context).size.height - height2 - MediaQuery.of(context).padding.top) * 0.0),
              decoration: BoxDecoration(
                color: getTheRightColor(),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Align(alignment: Alignment.center,
                            child: Text("$text", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16.sp+size),),),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.5),
                            child: getTheRightIcon()
                        ),
                      ],
                    ),
                  ]
              ),
            ),
          );
        }
    );
  }
}