import 'package:doctors_clinic/app/main/bottom_nav/bindings/bottom_nav_binding.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  setUp(() => Get.testMode = true);
  tearDown(Get.reset);

  testWidgets('WhatsApp hub shows key actions', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: const SizedBox.shrink(),
        getPages: AppPages.routes,
        initialRoute: Routes.WHATSAPP_HUB,
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text(kWhatsAppTitle), findsOneWidget);
    expect(find.text(kWhatsAppTemplatesTitle), findsOneWidget);
    expect(find.text(kWhatsAppComposeTitle), findsOneWidget);
    expect(find.text(kWhatsAppLogsTitle), findsOneWidget);
  });

  testWidgets('More tab shows WhatsApp menu', (WidgetTester tester) async {
    BottomNavBinding().dependencies();
    await tester.pumpWidget(
      GetMaterialApp(
        home: const SizedBox.shrink(),
        getPages: AppPages.routes,
        initialRoute: Routes.MAIN,
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text(kNavTabMore).last);
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(find.text(kWhatsAppMenuTitle), 120);

    expect(find.text(kWhatsAppMenuTitle), findsOneWidget);
  });
}
