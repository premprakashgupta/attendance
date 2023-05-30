import 'package:attendance/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  //
  Future<void> logout() async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      await firebaseAuth.signOut();

      Get.offNamed(Routes.LOGIN);
    } catch (e) {
      // Handle logout error
      print('Logout error: $e');
    }
  }
}
