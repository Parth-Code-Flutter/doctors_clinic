import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Splash screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump(const Duration(milliseconds: 800));

    expect(find.text(kAppName), findsOneWidget);
    expect(find.text(kAppTagline), findsOneWidget);

    await tester.pump(const Duration(seconds: 3));
  });
}
