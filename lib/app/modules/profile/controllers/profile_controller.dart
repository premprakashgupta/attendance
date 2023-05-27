import 'package:attendance/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  Future<void> logout() async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    try {
      await _firebaseAuth.signOut();

      Get.offNamed(Routes.LOGIN);
    } catch (e) {
      // Handle logout error
      print('Logout error: $e');
    }
  }
}
