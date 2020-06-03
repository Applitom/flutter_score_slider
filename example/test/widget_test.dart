import 'package:flutter_score_slider/flutter_score_slider.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:example/main.dart';

void main() {
  testWidgets('ScoreSlider Test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.byType(ScoreSlider), findsOneWidget);
  });
}
