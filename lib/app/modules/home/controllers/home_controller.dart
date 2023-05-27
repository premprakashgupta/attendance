import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;


  @override
  void onClose() {
    Get.delete<HomeController>();
    super.onClose();
  }

  void increment() => count.value++;
}
