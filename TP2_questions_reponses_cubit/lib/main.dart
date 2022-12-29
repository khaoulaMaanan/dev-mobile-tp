import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp2_questions_reponses_cubit/cubit/quizzPage_cubit.dart';
import 'package:tp2_questions_reponses_cubit/cubit/quizzPage_state.dart';
import 'package:tp2_questions_reponses_cubit/models/question_model.dart';
import 'package:tp2_questions_reponses_cubit/screens/quizz_page.dart';
import 'package:tp2_questions_reponses_cubit/screens/result_page.dart';

void main() {
  runApp(MyApp());
}

/*class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Question> _questions = [Question(questionText: "questionText 1 hhdbfdhguyfgdyugduvdhgugyugfudgvugduygfdsugugdvgcugdugdugvdugcudsgyttgdftgvyudguyvgdsyugdsyugvufdgvuyfvygytvgdytguydgfudguyvgdgyvugyvyugvuyfgvyufgtvufuvgtutvfuygvuyfgv?", isCorrect: true,imgUrl: "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"),
      Question(questionText: "questionText 2 ?", isCorrect: false,imgUrl: 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')
    ];
    return MaterialApp(
      home: BlocProvider(
        create: (context) => QuizzpageCubit(0, 0, _questions),
        child: BlocBuilder<QuizzpageCubit,QuizzpageInitial>(
          builder: (context,state){
            return QuizzPage();
          },
        ),
      ),
    );
  }
}*/

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Question> _questions = [Question(questionText: "questionText 1 hhdbfdhguyfgdyugduvdhgugyugfudgvugduygfdsugugdvgcugdugdugvdugcudsgyttgdftgvyudguyvgdsyugdsyugvufdgvuyfvygytvgdytguydgfudguyvgdgyvugyvyugvuyfgvyufgtvufuvgtutvfuygvuyfgv?", isCorrect: true,imgUrl: "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"),
      Question(questionText: "questionText 2 ?", isCorrect: false,imgUrl: 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')
    ];
    return MultiBlocProvider(
        providers: [
          BlocProvider<QuizzpageCubit>(
              create: (BuildContext context) => QuizzpageCubit(0, 0, _questions)
          )
        ],
        child: MaterialApp(
          home: QuizzPage(),
        )
    );
  }
}

