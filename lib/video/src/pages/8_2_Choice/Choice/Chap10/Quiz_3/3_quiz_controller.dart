import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:mirinae_gugu/video/src/components/Questions/Questions_10.dart';
import 'package:mirinae_gugu/video/src/pages/8_2_Choice/result_choice_quiz.dart';
import 'package:mirinae_gugu/video/src/components/Questions/Question.dart';

class QuestionController_103 extends GetxController with SingleGetTickerProviderMixin {
  late PageController _pageController;
  PageController get pageController => _pageController;

  static const List quiz = quiz10_2;

  final List<Question> _questions = quiz.map(
        (question) => Question(
      id: question['id'],
      options: question['options'],
      answer: question['answer_index'],
      VideoId: question['VideoId'],),
  ).toList();

  List<Question> get questions => _questions;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  late int _correctAns;
  int get correctAns => _correctAns;

  late int _selectedAns;
  int get selectedAns => _selectedAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;



  @override
  void onInit() {
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    _pageController.dispose();
    super.onClose();
  }

  void resetNumber(){
    _questionNumber.value = 1;
    _numOfCorrectAns = 0;
    _isAnswered = false;
  }

  void Video(Question question){
    _VideoId_ = question.VideoId as String?; //여긴 알빠아니고 null나옴

  }

  String? _VideoId_;
  String? get VideoId_ => _VideoId_;



  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;
    update();

    Future.delayed(Duration(milliseconds: 500), () {
      if (_questionNumber.value != _questions.length) {
        _isAnswered = false;

        _pageController.jumpToPage(_questionNumber.value++);
      } else {
        Get.off(ScoreScreen(lastscore: (numOfCorrectAns/_questions.length*100).round()));
        Get.delete<QuestionController_103>();
      }
    });
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}