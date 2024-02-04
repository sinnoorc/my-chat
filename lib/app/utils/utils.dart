import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:get/get.dart';

class Utils {
  Utils._();

  static showErrorSnackBar({required String title, required String message}) {
    return Get.snackbar(
      title,
      message,
      margin: EdgeInsets.zero,
      snackStyle: SnackStyle.GROUNDED,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      mainButton: TextButton(
        onPressed: () => Get.back(),
        child: const Text(
          'Close',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  static const colors = [
    Color(0xffff6767),
    Color(0xff66e0da),
    Color(0xfff5a2d9),
    Color(0xfff0c722),
    Color(0xff6a85e5),
    Color(0xfffd9a6f),
    Color(0xff92db6e),
    Color(0xff73b8e5),
    Color(0xfffd7590),
    Color(0xffc78ae5),
  ];

  static Color getUserAvatarNameColor(types.User user) {
    final index = user.id.hashCode % colors.length;
    return colors[index];
  }

 static String getUserName(types.User user) => '${user.firstName ?? ''} ${user.lastName ?? ''}'.trim();
}
