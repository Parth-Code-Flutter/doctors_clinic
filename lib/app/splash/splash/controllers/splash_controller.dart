import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final isReady = false.obs;

  @override
  void onInit() {
    super.onInit();
    _playIntroAnimation();
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 3), _onSplashComplete);
  }

  Future<void> _playIntroAnimation() async {
    await Future<void>.delayed(const Duration(milliseconds: 700));
    isReady.value = true;
  }

  void _onSplashComplete() {
    Get.offNamed(Routes.WELCOME);
  }
}
