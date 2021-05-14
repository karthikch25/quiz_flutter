import 'question.dart';


class QuizBrain {
  //question number and qns are private to make it more secure
  int _questionnumber = 0;
  List <Question> _qns = [
    Question('Sun rises in the East?', true),
    Question('Prabhas is South Indian Actor?', true),
    Question('Rose\'s are Red?', true),
  ];

  void nextQuestion() {
    if (_questionnumber < _qns.length - 1) {
      _questionnumber++;
    }
    print(_questionnumber);
    print(_qns.length);
  }

  bool isFinished() {
    if (_questionnumber >= _qns.length - 1) {
      return true;
    }
    return false;
  }

  String getQuestionText() {
    return _qns[_questionnumber].questionText;
  }

  bool getQuestionAnswer() {
    return _qns[_questionnumber].questionAnswer;
  }

  void reset()
  {
    _questionnumber=0;
  }
}