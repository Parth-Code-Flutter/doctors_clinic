import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  setUp(() {
    Get.testMode = true;
  });

  tearDown(Get.reset);

  testWidgets('Splash navigates to welcome after delay', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump(const Duration(milliseconds: 800));

    expect(find.text(kAppName), findsOneWidget);
    expect(find.text(kAppTagline), findsOneWidget);

    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    expect(find.text(kWelcomeTitle), findsOneWidget);
    expect(find.text(kLoginToClinicButton), findsOneWidget);
    expect(find.text(kOpenNewClinicButton), findsOneWidget);
  });
}
