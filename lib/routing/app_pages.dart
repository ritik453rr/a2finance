import 'package:a2finance/pages/app_webview/app_webview.dart';
import 'package:a2finance/pages/app_webview/app_webview_binding.dart';
import 'package:a2finance/pages/splash/splash_binding.dart';
import 'package:a2finance/pages/splash/splash_view.dart';
import 'package:a2finance/pages/welcome/welcome_binding.dart';
import 'package:a2finance/pages/welcome/welcome_view.dart';
import 'package:a2finance/routing/app_routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
     GetPage(
      name: AppRoutes.welcome,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),

    GetPage(
      name: AppRoutes.webview,
      page: () =>AppWebview(),
      binding: AppWebviewBinding()
    ),
  ];
}
