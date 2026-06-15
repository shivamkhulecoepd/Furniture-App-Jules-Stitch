import 'package:flutter_test/flutter_test.dart';
import 'package:furniture_app_jules_stitch/main.dart';

void main() {
  testWidgets('Welcome screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const FurnitureApp());
    expect(find.text('Design Your Dream\nLiving Space'), findsOneWidget);
  });
}
