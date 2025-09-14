import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Global {
  static const bottomSpace = 20;

  static void hapticFeedback() {
    if (GetPlatform.isIOS) {
      HapticFeedback.lightImpact();
    } else {
      HapticFeedback.vibrate();
    }
  }
}
