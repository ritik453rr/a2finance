import 'package:a2finance/pages/app_webview/app_webview_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppWebview extends StatelessWidget {
  AppWebview({super.key});
  final controller = Get.find<AppWebviewController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final canGoBack = await controller.webController.canGoBack();
        if (canGoBack) {
          controller.webController.goBack();
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              WebViewWidget(controller: controller.webController),

              // Loader on top of WebView
              Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator(
                    color: Colors.blueAccent,
                  ));
                } else {
                  return const SizedBox.shrink();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
