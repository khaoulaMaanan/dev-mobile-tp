import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2_questions_reponses/providers/QuizzpageProvider.dart';
import 'package:tp2_questions_reponses/screens/quizz_page.dart';
import 'package:tp2_questions_reponses/screens/result_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuizzPageProvider())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => QuizzPage(),
        '/result':(context)=>ResultPage()
      },
    );
  }
}
