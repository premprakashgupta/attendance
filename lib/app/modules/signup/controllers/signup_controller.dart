import 'package:attendance/app/modules/auth/controllers/auth_controller.dart';
import 'package:attendance/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthController _authController = Get.find<AuthController>();
  final selectedRole = 'student'.obs;
  Future<void> signupWithEmailPassword({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      // Sign up the user with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // seting user data in controller
      _authController.setCurrentUser = userCredential.user;
      // Get the user's unique ID
      String userId = userCredential.user!.uid;

      // Create a new document in the "users" collection with the generated ID and user data
      await _firestore.collection('users').doc(userId).set({
        'email': email,
        'username': username,
        'role': selectedRole.value,
        'id': userId,
        'userId': userId,
      });

      // Display success message
      Get.snackbar('Success', 'User signup successful');

      // You can perform additional actions after signup if needed
      // For example, navigate to a different screen
      Get.offAllNamed(Routes.LANDING);
    } catch (e) {
      // Display error message
      Get.snackbar('Error', 'User signup failed');
      print(e.toString());
    }
  }

  @override
  void onClose() {
    selectedRole.close();
    super.onClose();
  }
}
