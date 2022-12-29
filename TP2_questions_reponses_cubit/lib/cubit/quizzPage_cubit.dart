import 'package:bloc/bloc.dart';
import 'package:tp2_questions_reponses_cubit/cubit/quizzPage_state.dart';
import 'package:tp2_questions_reponses_cubit/models/question_model.dart';

class QuizzpageCubit extends Cubit<QuizzpageInitial> {
  QuizzpageCubit(this._index,this._score, this._questions) : super(QuizzpageInitial(0,0, _questions));
  int _index = 0;
  int _score=0;
  List<Question> _questions = [Question(questionText: "questionText 1 hhdbfdhguyfgdyugduvdhgugyugfudgvugduygfdsugugdvgcugdugdugvdugcudsgyttgdftgvyudguyvgdsyugdsyugvufdgvuyfvygytvgdytguydgfudguyvgdgyvugyvyugvuyfgvyufgtvufuvgtutvfuygvuyfgv?", isCorrect: true,imgUrl: "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"),
    Question(questionText: "questionText 2 ?", isCorrect: false,imgUrl: 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')
  ];


  void nextQuestion() {
    index = (index + 1);
    emit(QuizzpageInitial(index,score, questions));
  }

  int get index => _index;

  set index(int value) {
    _index = value;
    emit(QuizzpageInitial(index,score, questions));
  }
  int get score => _score;

  set score(int value) {
    _score = value;
    emit(QuizzpageInitial(index,score, questions));
  }
  void incrementScore(){
    score=score+20;
    emit(QuizzpageInitial(index,score, questions));
  }
  void decrementScore(){
    score=score-10;
    emit(QuizzpageInitial(index,score, questions));
  }

  List<Question> get questions => _questions;

  set questions(List<Question> value) {
    _questions = value;
    emit(QuizzpageInitial(index,score, questions));
  }
  void reset(){
    index=0;
    score=0;
    emit(QuizzpageInitial(index,score, questions));
  }
}
