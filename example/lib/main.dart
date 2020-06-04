import 'package:flutter/material.dart';
import 'package:flutter_score_slider/flutter_score_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Score Slider Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: MyHomePage(title: 'Score Slider Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentScore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: ScoreSlider(
                maxScore: 10,
                thumbColor: Colors.blue,
                scoreDotColor: Colors.white,
                onScoreChanged: (newScore) {
                  setState(() {
                    _currentScore = newScore;
                  });
                },
              ),
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              _currentScore == null
                  ? "No Score Selected"
                  : "Selected Score: $_currentScore",
                  style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
