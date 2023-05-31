import 'package:attendance/app/modules/auth/controllers/auth_controller.dart';
import 'package:attendance/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final AuthController _authController = Get.find<AuthController>();

  @override
  void onReady() {
    super.onReady();
    if (_authController.currentUser != null) {
      Get.offNamed(Routes.LANDING);
    } else {
      Get.offNamed(Routes.LOGIN);
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _authController.setCurrentUser = userCredential.user;

      // User is signed in, perform any necessary actions
      Get.offAllNamed(Routes.LANDING);
    } catch (e) {
      // Handle login error
      print('Login error: $e');
    }
  }
}
