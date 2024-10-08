import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constants/theme/colors_manager.dart';


showSnackBar(String message, {bool popPage = false, int duration = 5}) {
  ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
  ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      backgroundColor: ColorsManager.primary,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      content: Text(message, style:const TextStyle(color: Colors.white,fontSize: 12,),),
      action: SnackBarAction(
        label: '',
        onPressed: () {},
      ),
      duration: Duration(seconds: duration),
    ),
  );
  if (popPage) {
    Timer(
      const Duration(seconds: 5),
      () => Get.back(),
    );
  }
}