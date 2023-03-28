import 'package:day3/result.dart';
import 'package:flutter/material.dart';

import 'dummy.dart';
import 'main.dart';

//StatefulWidget
class QuizHome extends StatefulWidget {
  @override
  State<QuizHome> createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  int qNum = 10; //number of question
  int _questionIndex = 0;
  int _score = 0;
  QuizData thisProblem = QuizData();

  /*
  TODO 어딘가에 글로벌로 선언되거나..?파일로 저장되거나?하튼 준비된 퀴즈 파일을 QuizData의 list형태로 불러와서
  TODO 한놈한놈 임시변수 thisProblem에 담아서 로드하고싶음....
  TODO 근데 그 실행의 트리거를 어떻게 해야하지. 이전 페이지에서 start하면서 만들어 보내줫음 좋겟는데 어케보냄 파라미터
  */

  //check ans and up the score, mov to next question.
  void _toNextQuesion(bool correct) {
    setState(() {
      _questionIndex = (_questionIndex + 1) % qNum;
      if (correct) _score++;
      //TODO load new instance from QuizData array...
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz main page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //테스트 문제 만드는 임시버튼
                OutlinedButton.icon(
                  onPressed: () {
                    thisProblem.set_data(
                        "what is main color of apple, lip, rose?",
                        "red",
                        "blue",
                        "green",
                        "yellow",
                        false);
                  },
                  icon: Icon(Icons.add, size: 18),
                  label: Text("test"),
                ),
                Text(
                  'score : $_score',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
              //객관식 포맷
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "Q${_questionIndex + 1}\n ${thisProblem.question}",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      _toNextQuesion(true);
                      print('1. ${thisProblem.question}');
                    },
                    //'1. ${thisProblem.options[1][0]}'
                    child: Text('1. option'),
                    //Text('1. ${thisProblem.options[0][0]}'), TODO why error...
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      _toNextQuesion(true);
                    },
                    child: const Text('2. options'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      _toNextQuesion(true);
                    },
                    child: const Text('3. options'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      _toNextQuesion(true);
                    },
                    child: const Text('4. options'),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
              //서술형포맷도 따로 만들어야 할 듯. visibility 조절해서...?
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print("moving to quiz result page...");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(_score)),
                    );
                  },
                  child: Text("SHOW RESULT"),
                ),
                SizedBox(
                  width: 20,
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
          ],
        ),
      ),
    );
  }
}
