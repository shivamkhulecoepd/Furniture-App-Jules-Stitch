import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furniture_app_jules_stitch/main.dart';
import 'dart:io';

void main() {
  setUpAll(() {
    HttpOverrides.global = null;
  });

  testWidgets('Splash screen smoke test', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(const FurnitureApp());

    // We expect the splash screen text to be there.
    expect(find.text('MODERN'), findsOneWidget);
    expect(find.text('FURNITURE'), findsOneWidget);

    // Pump for timer (3 seconds)
    await tester.pump(const Duration(seconds: 4));
    await tester.pumpAndSettle();

    // Now we should be on the welcome screen.
    expect(find.text('Unique Furniture with\nGood Quality'), findsOneWidget);

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });
}
