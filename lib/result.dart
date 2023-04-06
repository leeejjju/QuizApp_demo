import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  late final int _score;

  ResultPage(this._score);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Your final score is...',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              '$_score\n',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            ElevatedButton(
              onPressed: () {
                print("moving to home...");
                Navigator.popUntil(
                  context,
                  ModalRoute.withName('/'),
                );
              },
              child: const Text("BACK TO MAIN"),
            ),
          ],
        ),
      ),
    );
  }
}
