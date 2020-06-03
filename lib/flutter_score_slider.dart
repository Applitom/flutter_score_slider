library flutter_score_slider;

import 'package:flutter/material.dart';

class ScoreSlider extends StatefulWidget {
  final double height;
  final int score;
  final int maxScore;
  final int minScore;
  final Color thumbColor;
  final Color scoreDotColor;
  final Color backgroundColor;
  final Function(int value) onScorChanged;

  ScoreSlider({
    @required this.maxScore,
    this.minScore = 0,
    this.score,
    this.onScorChanged,
    this.height = 30,
    this.thumbColor,
    this.scoreDotColor,
    this.backgroundColor,
  })  : assert(maxScore != null),
        assert(minScore < maxScore);

  @override
  State<StatefulWidget> createState() => ScoreSliderState();
}

class ScoreSliderState extends State<ScoreSlider> {
  int _currentScore;

  @override
  void initState() {
    super.initState();
    _currentScore = this.widget.score;
  }

  List<Widget> _dots(BoxConstraints size) {
    List<Widget> dots = List<Widget>();

    double width =
        size.maxWidth / (this.widget.maxScore - this.widget.minScore + 1);
    double selectedScoreRadius = (this.widget.height * 0.7) / 2;
    double dotRadius = (this.widget.height * 0.25) / 2;

    for (var i = this.widget.minScore; i <= this.widget.maxScore; i++) {
      double currentRadius =
          i == _currentScore ? selectedScoreRadius : dotRadius;
      dots.add(
        Container(
          width: width,
          child: Center(
            child: CircleAvatar(
              backgroundColor: i == _currentScore
                  ? this.widget.thumbColor ?? Theme.of(context).sliderTheme.thumbColor
                  : this.widget.scoreDotColor ?? Theme.of(context).sliderTheme.activeTickMarkColor,
              radius: currentRadius,
            ),
          ),
          color: Colors.transparent,
        ),
      );
    }

    return dots;
  }

  void _handlePanGesture(BoxConstraints size, Offset localPosition) {
    double socreWidth =
        size.maxWidth / (this.widget.maxScore - this.widget.minScore + 1);
    double x = localPosition.dx;
    int calculatedScore = (x ~/ socreWidth) + this.widget.minScore;
    if (calculatedScore != _currentScore &&
        calculatedScore <= this.widget.maxScore &&
        calculatedScore >= 0) {
      setState(() => _currentScore = calculatedScore);
      if (this.widget.onScorChanged != null) {
        this.widget.onScorChanged(_currentScore);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(
        builder: (context, size) {
          return GestureDetector(
            onPanDown: (details) {
              _handlePanGesture(size, details.localPosition);
            },
            onPanStart: (details) {
              _handlePanGesture(size, details.localPosition);
            },
            onPanUpdate: (details) {
              _handlePanGesture(size, details.localPosition);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                color: (this.widget.backgroundColor ?? Theme.of(context).backgroundColor) ,
              ),
              height: this.widget.height,
              child: Stack(
                children: <Widget>[
                  Row(
                    children: _dots(size),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
