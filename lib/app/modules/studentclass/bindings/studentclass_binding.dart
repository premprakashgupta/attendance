import 'package:get/get.dart';

import '../controllers/studentclass_controller.dart';

class StudentclassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentClassController>(
      () => StudentClassController(),
    );
  }
}
