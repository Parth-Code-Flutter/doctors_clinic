import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants/color_constants.dart';
import 'routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctors Clinic',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: kColorPrimary,
          primary: kColorPrimary,
          secondary: kColorAccent,
          surface: kColorSurface,
          error: kColorError,
        ),
        scaffoldBackgroundColor: kColorBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: kColorBackground,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          shadowColor: Colors.transparent,
          iconTheme: IconThemeData(color: kColorTitle),
          titleTextStyle: TextStyle(
            color: kColorTitle,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        useMaterial3: true,
      ),
    );
  }
}
