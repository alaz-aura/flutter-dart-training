// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('produce a new random phrase next', (WidgetTester tester) async {
    // build app
    await tester.pumpWidget(MaterialApp(home: MyApp()));
    
    // find widgets
    final nextButton = find.byKey(ValueKey("nextButton"));
    final randomWord = find.byKey(ValueKey("wordPair"));
    final startingPhrase = randomWord.evaluate().single.widget as Text;
    print(startingPhrase.data);

    // execute
    await tester.tap(nextButton);
    await tester.pump();
    final newPhrase = randomWord.evaluate().single.widget as Text;
    
    // check outputs
    print(newPhrase.data);
    expect(newPhrase.data == startingPhrase.data, false);
  });
}
