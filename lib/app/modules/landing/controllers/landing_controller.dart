import 'package:attendance/app/modules/auth/controllers/auth_controller.dart';
import 'package:attendance/app/services/class_services.dart';
import 'package:get/get.dart';

class LandingController extends GetxController {
  //
  final ClassService _classService = ClassService();
  final AuthController _authController = Get.find<AuthController>();

  @override
  void onInit() {
    _authController.setisLoading = true;

    super.onInit();
  }

  @override
  void onReady() {
    _userDataFnc();
    super.onReady();
  }

  _userDataFnc() async {
    try {
      Map<String, dynamic>? res = await _classService.getUserdata();

      _authController.setUserData = res ?? {};
      _authController.setisLoading = false;
    } catch (e) {
      printError();
    }
  }
}
