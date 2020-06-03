# Flutter Score Slider
A Flutter Score slider widget.

<p align="center">
  <img src="./screenshots/flutter_score_slider.png">
</p>

## How to use

Add flutter_score_slider to oyou project dependencies
```yaml
dependencies:
  flutter_score_slider: ^1.0.0
```

And install it using flutter packages get on your project folder. After that, just import the module and use it:

```dart
import 'package:flutter_score_slider/flutter_score_slider.dart';

// ...

ScoreSlider(
  maxScore: 10,
  onScorChanged: (newScore) {
    setState(() {
      _currentScore = newScore;
      });
    },
  )
```

### Customize colors
`flutter_score_slider` supports Flutter's themes and gets its look and feel by the app's default Theme style.
If you want to change the colors of the widget you can use the following parameters to set your own colors:

| Parameter  | Description  |
|--------------------|:----|
| `backgroundColor` | Set the background color |
| `thumbColor` | Set the thumb color (Selected value) |
| `scoreDotColor` | Set the score values "dots" color|

## Change Log
See [Change Log](./CHANGELOG.md) page.


## Contribution
Please file feature requests and bugs at the [issue tracker](https://github.com/applitom/flutter_score_slider/issues).

## Author
[Tomer Shalom](http://applitom.com)