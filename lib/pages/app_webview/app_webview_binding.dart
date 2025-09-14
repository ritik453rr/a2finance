import 'package:a2finance/pages/app_webview/app_webview_controller.dart';
import 'package:get/get.dart';

class AppWebviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppWebviewController());
  }
}
