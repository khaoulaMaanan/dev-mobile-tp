

import 'package:flutter/material.dart';
import 'package:quiz_app/screens/result_page.dart';

import '../models/question_model.dart';
void main() {
  runApp(MaterialApp(
    home: QuizzPage(),
  ),);
}
class QuizzPage extends StatefulWidget {
  const QuizzPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  //final String title;

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  List<Question> questions = [Question(questionText: "questionText 1 hhdbfdhguyfgdyugduvdhgugyugfudgvugduygfdsugugdvgcugdugdugvdugcudsgyttgdftgvyudguyvgdsyugdsyugvufdgvuyfvygytvgdytguydgfudguyvgdgyvugyvyugvuyfgvyufgtvufuvgtutvfuygvuyfgv?", isCorrect: true,imgUrl: "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"),
  Question(questionText: "questionText 2 ?", isCorrect: false,imgUrl: 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')
  ];
  int index = 0;
  int score = 0;
  late bool reponse;
  String buttonText="";


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Questions / Réponses"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(

        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              margin: EdgeInsets.only(left: 20.0,top: 0.0,right: 20.0,bottom: 40.0),
                child: Image(
                  image: NetworkImage("https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"),
                ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0,top: 0.0,right: 20.0,bottom: 20.0),
              child: Text(questions[index].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Helvetica",fontSize: 20,color: Colors.black),
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20.0,top: 0.0,right: 0.0,bottom: 20.0),
                  child :ElevatedButton(
                    style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20),backgroundColor: Colors.green),
                    onPressed: () {
                      reponse=true;
                    },
                    child: const Text('Vrai'),
                  ),
                ),


                Container(
                  margin: EdgeInsets.only(left: 20.0,top: 0.0,right: 0.0,bottom: 20.0),
                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20),backgroundColor: Colors.red),
                    onPressed: () {
                      reponse=false;
                    },

                    child: const Text('Faux'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0,top: 0.0,right: 0.0,bottom: 20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                    onPressed: () {

                        if(questions[index].isCorrect==reponse){
                          setState(() {
                            score+=20;
                            nextQuestion();
                          });
                        }else{
                          setState(() {
                            score-=10;
                            nextQuestion();
                          });

                        }

                    },
                    child: const Text('Question suivante'),
                  ),
                ),

              ],
            ),
            Container(
              child: Text("Score : ""$score ",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Helvetica",fontSize: 30,fontWeight:FontWeight.bold,color: Colors.black54),
              ),
            )
          ],
        ),
      ),
    );
  }
  nextQuestion(){
    if(index < questions.length -1){
        index++;
    }else{
      Navigator.pushReplacement(context,
          MaterialPageRoute(
              builder: (context) => ResultPage(
                score: score,
              )));

    }
  }
}