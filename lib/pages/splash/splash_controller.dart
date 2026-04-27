import 'package:a2finance/common/app_storage.dart';
import 'package:a2finance/routing/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(milliseconds: 2000), () {
      Get.offNamed(AppRoutes.webview);
      // AppStorage.isWelcomeDone()
      //     ? Get.offNamed(AppRoutes.webview)
      //     : Get.offNamed(AppRoutes.welcome);
    });
  }
}
