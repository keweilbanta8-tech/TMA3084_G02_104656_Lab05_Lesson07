
import 'package:flutter_test/flutter_test.dart';
import 'package:bottom_navigator_bar_lab/main.dart';

void main() {
  testWidgets('Bottom navigation bar displays four screens',
      (WidgetTester tester) async {
    await tester.pumpWidget(const BottomNavLab());

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Alarm'), findsOneWidget);
    expect(find.text('Business'), findsOneWidget);
    expect(find.text('School'), findsOneWidget);
  });
}
