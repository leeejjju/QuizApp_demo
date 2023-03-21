import 'package:day3/result.dart';
import 'package:flutter/material.dart';

import 'main.dart';

//StatefulWidget
class QuizMain extends StatefulWidget {
  @override
  State<QuizMain> createState() => _QuizMainState();
}

class _QuizMainState extends State<QuizMain> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz main page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'score : $_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () {
                print("moving to quiz result page...");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultPage(_counter)),
                );
              },
              child: Text("SHOW RESULT"),
            ),
            OutlinedButton(
              onPressed: () {
                print("moving to main home...");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
              child: Text("BACK TO MAIN"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
//
// class QuizPage extends StatefulWidget {
//   const QuizPage({Key? key}) : super(key: key);
//
//   @override
//   State<QuizMain> createState() => _QuizMainState();
// }
//
// class _QuizMainState extends State<QuizMain> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
