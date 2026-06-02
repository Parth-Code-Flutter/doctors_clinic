import 'package:doctors_clinic/app/main/bottom_nav/bindings/bottom_nav_binding.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  setUp(() => Get.testMode = true);
  tearDown(Get.reset);

  testWidgets('Queue list screen shows summary and filters', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: const SizedBox.shrink(),
        getPages: AppPages.routes,
        initialRoute: Routes.QUEUE_LIST,
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text(kQueueTitle), findsOneWidget);
    expect(find.text(kQueueSummaryInConsultation), findsOneWidget);
    expect(find.text(kQueueFilterWithDoctor), findsOneWidget);
    expect(find.text(kQueueSearchHint), findsOneWidget);
  });

  testWidgets('More tab shows queue menu entry', (WidgetTester tester) async {
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

    expect(find.text(kQueueMenuTitle), findsOneWidget);
  });
}
