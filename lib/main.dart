import 'package:day3/quizHome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Quiz app of leeejjju'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String nyanCat =
      "https://i0.wp.com/www.printmag.com/wp-content/uploads/2021/02/4cbe8d_f1ed2800a49649848102c68fc5a66e53mv2.gif?resize=476%2C280&ssl=1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Let\'s go to solve the Quiz!',
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
            Image.network(
              nyanCat,
              height: 180,
              width: 360,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 70,
              width: 210,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizHome()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontFamily: 'Roboto', // 왜 반영 안되지ㅠ
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                child: const Text("START"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
