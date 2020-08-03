import 'package:flutter/material.dart';
import 'package:flutter_basics/src/pages/basic_page.dart';
import 'package:flutter_test/flutter_test.dart';

// import '../lib/main.dart';

void main() {
  testWidgets('Find first page', (WidgetTester tester) async {
    final pageTitle = "Nueva página de inicio";

    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: BasicPage(pageTitle: pageTitle),
    ));

    // verify the title exist
    expect(find.text("Basic page"), findsOneWidget);
    expect(find.text(pageTitle), findsOneWidget);
  });
}
