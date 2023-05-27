import 'package:attendance/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthGuardMiddleware extends GetMiddleware {
  final AuthController _authController = Get.put(AuthController());

  @override
  RouteSettings? redirect(String? route) {
    if (_authController.currentUser == null) {
      return const RouteSettings(name: '/login');
    }
    return null;
  }
}
