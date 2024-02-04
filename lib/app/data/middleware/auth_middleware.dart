import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../service/auth_service.dart';

class AuthMiddleware extends GetMiddleware {
  final AuthService _authService = Get.find<AuthService>();

  bool get _isAuthenticated => _authService.user != null;

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (!_isAuthenticated && route != Routes.login) {
      return const RouteSettings(name: Routes.login);
    }
    return null;
  }
}
