import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      body: SafeArea(
        child: Center(
          child: Obx(
            () => AnimatedScale(
              duration: const Duration(milliseconds: 650),
              curve: Curves.easeOutBack,
              scale: controller.isReady.value ? 1 : 0.88,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: controller.isReady.value ? 1 : 0,
                child: const _SplashContent(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SplashContent extends StatelessWidget {
  const _SplashContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
            color: kColorPrimary,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: kColorPrimary.withValues(alpha: 0.22),
                blurRadius: 28,
                offset: const Offset(0, 16),
              ),
            ],
          ),
          child: const Icon(
            Icons.local_hospital_rounded,
            color: kColorSurface,
            size: 46,
          ),
        ),
        const SizedBox(height: 22),
        const Text(
          kAppName,
          style: TextStyle(
            color: kColorText,
            fontSize: 28,
            fontWeight: FontWeight.w700,
            letterSpacing: 0,
          ),
        ),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            kAppTagline,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kColorTextSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: 0,
            ),
          ),
        ),
        const SizedBox(height: 28),
        const SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2.4,
            color: kColorPrimary,
          ),
        ),
      ],
    );
  }
}
