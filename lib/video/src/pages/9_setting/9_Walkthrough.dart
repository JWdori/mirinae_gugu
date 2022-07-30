import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sizer/sizer.dart';

GlobalKey<IntroductionScreenState> _introScreenKey = GlobalKey<IntroductionScreenState>();

class WalkthroughScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: _introScreenKey,
      pages: [
        PageViewModel(
          title: '[공지사항]을\n확인해주세요!',
          body: '',
        image:Semantics(
          label:"홈 화면",
          child:  buildImage('assets/Walkthrough1/Walkthrough-1.jpg')),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: '발음 방법과 동작을\n확인해주세요',
          body: '',
    image:Semantics(
    label:"조음학습 선택 페이지",
    child:  buildImage('assets/Walkthrough1/Walkthrough-2.jpg')),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: '완료한 학습과 시험은\n아이콘과 색으로\n확인할 수 있어요',
          body: '',
    image:Semantics(
    label:"학습 선택 페이지",
    child:  buildImage('assets/Walkthrough1/Walkthrough-3.jpg')),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: '[녹음하기]를 통해\n녹음할 수 있어요',
          body: '버튼으로 카메라를 끄고 킬 수 있어요',
    image:Semantics(
    label:"학습 페이지",
    child: buildImage('assets/Walkthrough1/Walkthrough-4.jpg')),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: '[받아쓰기]를 통해\n발음을 확인해보세요!',
          body: '다시 버튼을 사용하면 글자들이 깨끗이 사라져요',
    image:Semantics(
    label:"학습 페이지",
    child:  buildImage('assets/Walkthrough1/Walkthrough-5.jpg')),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: '[녹음]을 듣거나\n삭제할 수 있어요',
          body: '',
          image:Semantics(
          label:"녹음 페이지",
          child: buildImage('assets/Walkthrough1/Walkthrough-6.jpg')),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: '복습시험은 [객관식]과\n[말하기] 유형이 있어요',
          body: '시험에 통과하면 버튼 색깔이 변해요',
          image: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/Walkthrough1/Walkthrough-7-1.jpg',semanticLabel: "복습 시험 객관식페이지",),
              Image.asset('assets/Walkthrough1/Walkthrough-7-2.jpg',semanticLabel: "복습 시험 말하기페이지",),
            ],),
          decoration: PageDecoration(
              titleTextStyle: TextStyle(fontSize: 20.0.sp, fontWeight: FontWeight.bold, color:Colors.white,fontFamily: "cookie"),
              bodyTextStyle: TextStyle(fontSize: 12.0.sp, color:Colors.white,fontFamily: "cookie"),
              //descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
              //imagePadding: EdgeInsets.all(10),
              pageColor: Color(0xFF489BFB),
              imageFlex: 2,
              imagePadding: EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.15)
          ),
        ),
        PageViewModel(
          title: '글꼴, 글자 크기 등의\n[설정]을 할 수 있어요',
          body: '변경 내용을 적용하려면 앱을 다시 시작해야해요!',
          image:Semantics(
              label:"설정 페이지",
              child: buildImage('assets/Walkthrough1/Walkthrough-8.jpg')),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: '녹음 버튼이나 받아쓰기\n버튼을 연달아 빠르게\n누르지 마세요!!',
          body: '오류가 발생할 경우, 앱을 다시 실행하거나\n앱 정보>저장공간>데이터삭제를 해주세요!',
          //image: buildImage('assets/GGJJ_logo.JPG'),
          footer: RaisedButton(
            onPressed: () => goToHome(context),
            color: Colors.white,
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Text(
              '닫기',
              style: TextStyle(color: Colors.black, fontSize: 14.0.sp, fontWeight: FontWeight.bold),
            ),
          ),
          decoration: PageDecoration(
            titleTextStyle: TextStyle(fontSize: 20.0.sp, fontWeight: FontWeight.bold, color:Colors.white,fontFamily: "cookie"),
            bodyTextStyle: TextStyle(fontSize: 12.0.sp, color:Colors.white,fontFamily: "cookie"),
            //descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
            titlePadding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.35, 0, 20),
            descriptionPadding: EdgeInsets.all(10),
            pageColor: Color(0xFF489BFB),
          ),
        ),
      ],
      done: Text('닫기', style: TextStyle(color: Colors.white,fontSize: 14.0.sp,fontWeight: FontWeight.w600)),
      onDone: () => goToHome(context),

      globalBackgroundColor: Color(0xFF489BFB),
      showNextButton: true,
      showSkipButton: true,
      showDoneButton: true,

      skip: Icon(Icons.arrow_back, color: Colors.white,semanticLabel: "이전으로",),
      //onSkip: () => goToHome(context),
      onSkip:() => _introScreenKey.currentState?.previous(),
      next: Icon(Icons.arrow_forward, color: Colors.white,semanticLabel:"다음으로"),

      dotsDecorator: getDotDecoration(),
      skipFlex: 0,
      nextFlex: 0,
    );
  }

  void goToHome(context) =>  Navigator.of(context).pop();

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
    color: Color(0xFFBDBDBD),
    size: Size(10, 10),
    activeSize: Size(22, 10),
    activeColor: Colors.white,
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
  );

  PageDecoration getPageDecoration() => PageDecoration(
    titleTextStyle: TextStyle(fontSize: 20.0.sp, fontWeight: FontWeight.bold, color:Colors.white,fontFamily: "cookie"),
    bodyTextStyle: TextStyle(fontSize: 12.0.sp, color:Colors.white,fontFamily: "cookie"),
    //descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
    //imagePadding: EdgeInsets.all(10),
    pageColor: Color(0xFF489BFB),
    imageFlex: 3,
    imagePadding: EdgeInsets.only(top:40)
  );
}