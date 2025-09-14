import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppWebviewController extends GetxController {
  late final WebViewController webController;

  // RxBool to track loading state
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();

    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            isLoading.value = true;  // Show loader
          },
          onPageFinished: (url) {
            isLoading.value = false; // Hide loader
          },
          onWebResourceError: (error) {
            isLoading.value = false; // Hide loader on error too
            Get.snackbar('Error', 'Failed to load page: ${error.description}');
          },
        ),
      )
      ..loadRequest(Uri.parse('https://aa2finance.com/'));
  }
}
