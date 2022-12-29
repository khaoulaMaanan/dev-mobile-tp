import 'package:flutter/material.dart';

import '../models/question_model.dart';

class QuizzPageProvider with ChangeNotifier {
  List<Question> _questions = [Question(questionText: "questionText 1 hhdbfdhguyfgdyugduvdhgugyugfudgvugduygfdsugugdvgcugdugdugvdugcudsgyttgdftgvyudguyvgdsyugdsyugvufdgvuyfvygytvgdytguydgfudguyvgdgyvugyvyugvuyfgvyufgtvufuvgtutvfuygvuyfgv?", isCorrect: true,imgUrl: "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"),
    Question(questionText: "questionText 2 ?", isCorrect: false,imgUrl: 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')
  ];
  int _index = 0;
  int _score = 0;

  int get index => _index;

  set index(int value) {
    _index = value;
    notifyListeners();
  }
  int get score => _score;
  set score(int value) {
    _score = value;
    notifyListeners();
  }
  void incrementScore(){
    score=score+20;
    notifyListeners();
  }
  void decrementScore(){
    score=score-10;
    notifyListeners();
  }

  List<Question> get questions => _questions;

  set questions(List<Question> value) {
    _questions = value;
    notifyListeners();
  }

  void nextQuestion() {
    index = (index + 1);
    notifyListeners();
  }
  void reset(){
    index=0;
    score=0;
  }




}