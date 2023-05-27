import 'package:get/get.dart';

import '../controllers/reciept_controller.dart';

class RecieptBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecieptController>(
      () => RecieptController(),
    );
  }
}
