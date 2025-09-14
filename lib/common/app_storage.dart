import 'package:get_storage/get_storage.dart';

class AppStorage {
  static final storage = GetStorage();

  /// Keys
  static const welcomeFinish = "welcomeFinish";

static  bool isWelcomeDone() {
    return storage.read(welcomeFinish) ?? false;
  }

  static void setWelcome(bool value) {
    storage.write(welcomeFinish, value);
  }
}
