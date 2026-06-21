import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nourish/main.dart';

void main() {
  testWidgets('NourishApp renders without error', (WidgetTester tester) async {
    await tester.pumpWidget(const NourishApp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
