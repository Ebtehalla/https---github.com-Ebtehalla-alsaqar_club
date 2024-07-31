import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationService extends GetxService {
  @override
  void onInit() {
    Get.updateLocale(
      const Locale('ar', 'EG'),
    );
    super.onInit();
  }

  setLocale(String newLang, [bool isWithRestart = false]) async {
    Get.updateLocale(Locale(newLang));
    if (isWithRestart) {
      // Restart.restartApp();
    }
  }

  bool isAr() {
    return Get.locale?.languageCode == 'ar';
  }
}
