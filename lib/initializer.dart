import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'app/data/service/auth_service.dart';
import 'firebase_options.dart';

class Initializer {
  Initializer._();

  static Future<void> init() async {
    await _initFirebase();
    await _initAuthServices();
    await _initEasyLoading();
    Get.log('All services initialized');
  }

  static Future<void> _initFirebase() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }

  static Future<void> _initAuthServices() async {
    await Get.putAsync<AuthService>(() => AuthService().init());
  }

  static Future<void> _initEasyLoading() async {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = Get.isDarkMode ? EasyLoadingStyle.dark : EasyLoadingStyle.light
      ..userInteractions = false
      ..dismissOnTap = false;
  }
}
