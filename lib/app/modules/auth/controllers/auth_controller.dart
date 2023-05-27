import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final Rx<User?> _currentUser = Rx<User?>(null);
  final Rx<Map<String, dynamic>?> _userData = Rx<Map<String, dynamic>?>(null);

  User? get currentUser => _currentUser.value;
  Map<String, dynamic>? get userData => _userData.value;

  set setCurrentUser(User? value) => _currentUser.value = value;
  set setUserData(Map<String, dynamic>? value) => _userData.value = value;

  @override
  void onInit() {
    super.onInit();

    _bindAuthStateChanges();
  }

  void _bindAuthStateChanges() {
    _currentUser.bindStream(_firebaseAuth.authStateChanges());
  }
}
