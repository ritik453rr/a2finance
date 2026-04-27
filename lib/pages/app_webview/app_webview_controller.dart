import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppWebviewController extends GetxController {
  // late final WebViewController webController;

  // RxBool to track loading state
  var isLoading = true.obs;
  var a2financeLink = 'https://aa2finance.com/';
  var hrmsA2Finance = "https://Hrms.aa2finance.com";
  var runyHrsMsLink = 'https://hrms.runytechnologies.com/login';
  var bhargavi = "https://Hr.shreebhargavifoundation.com";

   InAppWebViewController? webController;

  // var isLoading = true.obs;
  var errorMessage = ''.obs;

  final String url = "https://aa2finance.com/";

  @override
  void onInit() {
    super.onInit();

    // webController =
    //     WebViewController()
    //       ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //       ..setNavigationDelegate(
    //         NavigationDelegate(
    //           onPageStarted: (url) {
    //             isLoading.value = true; // Show loader
    //           },
    //           onPageFinished: (url) {
    //             isLoading.value = false; // Hide loader
    //           },
    //           onWebResourceError: (error) {
    //             isLoading.value = false; // Hide loader on error too
    //             Get.snackbar(
    //               'Error',
    //               'Failed to load page: ${error.description}',
    //             );
    //           },
    //         ),
    //       )
    //       ..loadRequest(Uri.parse(bhargavi));
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
