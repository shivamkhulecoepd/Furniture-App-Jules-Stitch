import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furniture_app_jules_stitch/main.dart';
import 'dart:io';

void main() {
  setUpAll(() {
    HttpOverrides.global = null;
  });

  testWidgets('Welcome screen smoke test', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(const FurnitureApp());
    await tester.pumpAndSettle();

    // We expect the image to fail in test environment, but the text should be there.
    expect(find.text('Unique Furniture with\nGood Quality'), findsOneWidget);

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });
}
