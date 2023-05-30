import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final Rx<User?> _currentUser = Rx<User?>(null);
  final Rx<Map<String, dynamic>?> _userData = Rx<Map<String, dynamic>?>(null);
  final _isLoading = false.obs;

  User? get currentUser => _currentUser.value;
  Map<String, dynamic>? get userData => _userData.value;
  bool get isLoading => _isLoading.value;

  set setCurrentUser(User? value) => _currentUser.value = value;
  set setUserData(Map<String, dynamic>? value) => _userData.value = value;
  set setisLoading(bool value) => _isLoading.value = value;

  @override
  void onInit() {
    super.onInit();

    _bindAuthStateChanges();
  }

  void _bindAuthStateChanges() {
    _currentUser.bindStream(_firebaseAuth.authStateChanges());
  }

  @override
  void onClose() {
    _currentUser.close();
    _isLoading.close();
    _userData.close();
    super.onClose();
  }
}
