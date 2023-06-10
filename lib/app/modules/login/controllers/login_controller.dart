import 'package:attendance/app/modules/auth/controllers/auth_controller.dart';
import 'package:attendance/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final AuthController _authController = Get.find<AuthController>();
  final _isLoading = false.obs;
  get isLoading => _isLoading.value;
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
      _isLoading.value = true;
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _authController.setCurrentUser = userCredential.user;
      _isLoading.value = false;
      // User is signed in, perform any necessary actions
      Get.offAllNamed(Routes.LANDING);
    } on FirebaseException catch (e) {
      String errorMessage = e.message ?? 'An unknown error occurred';
      const prefix = 'An unknown error occurred: FirebaseError: Firebase:';
      if (errorMessage.startsWith(prefix)) {
        errorMessage = errorMessage.substring(prefix.length);
      }
      // Handle login error
      Get.snackbar('Login Error', errorMessage);

      _isLoading.value = false;
    }
  }

  @override
  void onClose() {
    _isLoading.close();
    super.onClose();
  }
}
