import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';
import 'package:mirinae_gugu/video/src/pages/1_Loading.dart';

List<Map<String, Object>> WALKTHROUGH_ITEMS = [
  {
    'image': 'assets/Walkthrough/Walkthrough-1.png',
    'button_text': '계속하기',
    'button_text1': '되돌리기',
    'String':'sadasdasd',
  },
  {
    'image': 'assets/Walkthrough/Walkthrough-2.png',
    'button_text': '계속하기',
    'button_text1': '되돌리기',
    'String':'sadasdasd',
  },
  {
    'image': 'assets/Walkthrough/Walkthrough-3.png',
    'button_text': '계속하기',
    'button_text1': '되돌리기',
  },
  {
    'image': 'assets/Walkthrough/Walkthrough-4.png',
    'button_text': '계속하기',
    'button_text1': '되돌리기',
  },
  {
    'image': 'assets/Walkthrough/Walkthrough-5.png',
    'button_text': '계속하기',
    'button_text1': '되돌리기',
  },
  {
    'image': 'assets/Walkthrough/Walkthrough-6.png',
    'button_text': '계속하기',
    'button_text1': '되돌리기',
  },
  {
    'image': 'assets/Walkthrough/Walkthrough-7.png',
    'button_text': '계속하기',
    'button_text1': '되돌리기',
  },
  {
    'image': 'assets/Walkthrough/Walkthrough-8.png',
    'button_text': '계속하기',
    'button_text1': '되돌리기',
  },
  {
    'image': 'assets/Walkthrough/Walkthrough-9.png',
    'button_text': '계속하기',
    'button_text1': '되돌리기',
  },
  {
    'image': 'assets/Walkthrough/Walkthrough-10.png',
    'button_text': '끝마치기',
    'button_text1': '되돌리기',
  }
];

class WalkthroughItem extends StatefulWidget {
  final index;
  final totalItem;
  final controller;
  final Map<String, dynamic>? item;

  const WalkthroughItem(
      {Key? key, this.controller, this.index, this.totalItem, this.item,})
      : super(key: key);

  @override
  _WalkthroughItemState createState() => _WalkthroughItemState();
}

List asd =[
  "[공지사항]을 확인해주세요",
  "발음 방법과 동작을 확인해주세요",
  "완료한 학습과 시험은 아이콘과 색으로 확인할 수 있어요!",
  "[녹음하기]를 통해 녹을할 수 있어요!",
  "[받아쓰기]를 통해 발음을 확인해 보세요! [다시] 버튼을 사용하면 글자들이 깨끗이 사라져요!",
  "[녹음]을 듣거나 삭제할 수 있어요!",
  "[복습시험]은 객관식과 말하기 유형이 있어요! 시험에 통과하면 버튼 색깔이 변해요! 객관식 유형 시험 예시",
  "말하기 유형 시험 예시",
  "[글꼴], [글자크기] 등의 설정을 할 수 있어요! 변경 내용을 적용하려면 앱을 다시 시작해야해요!",
  "녹음 버튼이나 받아쓰기 버튼을 연달아 빠르게 누르지 마세요!! 오류가 발생할 경우, 앱을 다시 실행하거나 앱 정보> 저장공간> 데이터 삭제를 해주세요!"];
class _WalkthroughItemState extends State<WalkthroughItem> {
  @override
  Widget build(BuildContext context) {
    Color selectedColor = Color.fromRGBO(11, 50, 118, 0.6);
    Color normalColor = Colors.grey;
    final height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(color: Color(0xFF489BFB)),
      child: Stack(children: [
        Center(

          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.item!['image'] ?? ''),
                  fit: BoxFit.fill),
            ),)
        ),
        Container(
            alignment: Alignment.bottomCenter,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children :[
                  InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    onTap: () async {
                      if ((widget.index) != 0){
                        await widget.controller.animateToPage(
                          widget.index - 1,
                          curve: Curves.easeInOut,
                          //curve: Curves.bounceIn,
                          duration: Duration(milliseconds: 200),
                        );
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: MediaQuery.of(context).size.width*0.3,
                      margin: EdgeInsets.only(bottom: 30, left: 30, right: 30),
                      padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 5),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(28, 75, 169, 1),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(11, 50, 118, 0.6),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Semantics(
                          label: asd[widget.index],
                          child: Text(
                            widget.item!['button_text1'] ?? 'Back',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16.sp + size),
                          )),
                    ),
                  ),
                  InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    onTap: () async {
                      if ((widget.index + 1) == widget.totalItem) {
                        Navigator.of(context).pop();
                      } else {
                        await widget.controller.animateToPage(
                          widget.index + 1,
                          curve: Curves.easeInOut,
                          duration: Duration(milliseconds: 200),
                        );
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: MediaQuery.of(context).size.width*0.3,
                      margin: EdgeInsets.only(bottom: 30, left: 30, right: 30),
                      padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 5),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(28, 75, 169, 1),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(11, 50, 118, 0.6),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Semantics(
                          label: asd[widget.index],
                          child: Text(
                            widget.item!['button_text'] ?? 'Continue',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16.sp+size),
                          )),
                    ),
                  ),
                ]
            )
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: height * 0.75),
            child: Container(
              height: 8,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Material(
                    color: (widget.index == 0) ? selectedColor : normalColor,
                    type: MaterialType.circle,
                    child: Container(width: 8, height: 8),
                  ),
                  Material(
                    color: (widget.index == 1) ? selectedColor : normalColor,
                    type: MaterialType.circle,
                    child: Container(width: 8, height: 8),
                  ),
                  Material(
                    color: (widget.index == 2) ? selectedColor : normalColor,
                    type: MaterialType.circle,
                    child: Container(width: 8, height: 8),
                  ),
                  Material(
                    color: (widget.index == 3) ? selectedColor : normalColor,
                    type: MaterialType.circle,
                    child: Container(width: 8, height: 8),
                  ),
                  Material(
                    color: (widget.index == 4) ? selectedColor : normalColor,
                    type: MaterialType.circle,
                    child: Container(width: 8, height: 8),
                  ),
                  Material(
                    color: (widget.index == 5) ? selectedColor : normalColor,
                    type: MaterialType.circle,
                    child: Container(width: 8, height: 8),
                  ),
                  Material(
                    color: (widget.index == 6) ? selectedColor : normalColor,
                    type: MaterialType.circle,
                    child: Container(width: 8, height: 8),
                  ),
                  Material(
                    color: (widget.index == 7) ? selectedColor : normalColor,
                    type: MaterialType.circle,
                    child: Container(width: 8, height: 8),
                  ),
                  Material(
                    color: (widget.index == 8) ? selectedColor : normalColor,
                    type: MaterialType.circle,
                    child: Container(width: 8, height: 8),
                  ),
                  Material(
                    color: (widget.index == 9) ? selectedColor : normalColor,
                    type: MaterialType.circle,
                    child: Container(width: 8, height: 8),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}