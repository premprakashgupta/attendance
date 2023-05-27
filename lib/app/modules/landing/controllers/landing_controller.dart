import 'package:attendance/app/modules/auth/controllers/auth_controller.dart';
import 'package:attendance/app/services/class_services.dart';
import 'package:get/get.dart';

class LandingController extends GetxController {
  //TODO: Implement LandingController
  final ClassService _classService = ClassService();
  final AuthController _authController = Get.find<AuthController>();

  @override
  void onInit() {
    print("object landing init");

    super.onInit();
  }

  @override
  void onReady() {
    _userDataFnc();
    super.onReady();
  }

  _userDataFnc() async {
    print("userDataFnc");
    try {
      Map<String, dynamic>? res = await _classService.getUserdata();
      print(res);
      _authController.setUserData = res ?? {};
    } catch (e) {
      printError();
    }
  }
}
