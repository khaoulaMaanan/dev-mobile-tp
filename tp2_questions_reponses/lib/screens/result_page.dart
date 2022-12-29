

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tp2_questions_reponses/screens/quizz_page.dart';

import '../models/question_model.dart';
import '../providers/QuizzpageProvider.dart';
class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _quizzpageProvider = Provider.of<QuizzPageProvider>(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Résultats"),
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
              child: Text("Score final: ""${_quizzpageProvider.score} ",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Helvetica",fontSize: 30,fontWeight:FontWeight.bold,color: Colors.black54),
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 90.0,top: 30.0,right: 0.0,bottom: 20.0),
                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 25)),
                    onPressed: () {
                      _quizzpageProvider.reset();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(
                              builder: (context) => QuizzPage(
                              )));
                    },


                    child: const Text('Rejouer'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50.0,top: 30.0,right: 0.0,bottom: 20.0),
                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 25),backgroundColor: Colors.black26),
                    onPressed: () {
                      SystemNavigator.pop();
                    },


                    child: const Text('Quitter'),
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }


  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  //final String title;

}
