import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class AppWebviewController extends GetxController {
  // late final WebViewController webController;

  // RxBool to track loading state
  // var isLoading = true.obs;
  var hrmsA2Finance = "https://hrms.aa2finance.com";
  var bhargavi = "https://Hr.shreebhargavifoundation.com";

  InAppWebViewController? webController;

  // var isLoading = true.obs;
  var errorMessage = ''.obs;
  @override
  void onInit() {
    super.onInit();
    requestLocationPermission();
  }

  Future<void> requestLocationPermission() async {
    var status = await Permission.location.request();

    if (status.isDenied) {
      errorMessage.value = "Location permission denied";
    }

    if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  void reloadPage() {
    webController?.reload();
  }

  Future<bool> goBack() async {
    if (await webController?.canGoBack() ?? false) {
      webController?.goBack();
      return false;
    }
    return true;
  }
}
