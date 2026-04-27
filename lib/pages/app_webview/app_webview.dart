import 'package:a2finance/pages/app_webview/app_webview_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class AppWebview extends GetView<AppWebviewController> {
  const AppWebview({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.goBack,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("WebView"),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: controller.reloadPage,
            ),
          ],
        ),
        body: Stack(
          children: [
            InAppWebView(
              initialUrlRequest:
                  URLRequest(url: WebUri(controller.url)),

              initialSettings: InAppWebViewSettings(
                javaScriptEnabled: true,
                geolocationEnabled: true, // 🔥 important
                mediaPlaybackRequiresUserGesture: false,
              ),

              onWebViewCreated: (webViewController) {
                controller.webController = webViewController;
              },

              onLoadStart: (_, __) {
                controller.isLoading.value = true;
              },

              onLoadStop: (_, __) {
                controller.isLoading.value = false;
              },

              onReceivedError: (_, __, error) {
                controller.isLoading.value = false;
                controller.errorMessage.value = error.description ?? "Error";
              },

              /// 🔥 LOCATION PERMISSION HANDLER
              androidOnGeolocationPermissionsShowPrompt:
                  (controller, origin) async {
                return GeolocationPermissionShowPromptResponse(
                  origin: origin,
                  allow: true,
                  retain: true,
                );
              },
            ),

            /// 🔄 Loader
            Obx(() => controller.isLoading.value
                ? Container(
                    color: Colors.black.withOpacity(0.1),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const SizedBox.shrink()),

            /// ❌ Error UI
            Obx(() {
              if (controller.errorMessage.isNotEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error, color: Colors.red),
                      const SizedBox(height: 10),
                      Text(controller.errorMessage.value),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: controller.reloadPage,
                        child: const Text("Retry"),
                      )
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}