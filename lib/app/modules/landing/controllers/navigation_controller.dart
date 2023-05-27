import 'package:get/get.dart';

class NavigationController extends GetxController {
  //TODO: Implement NavigationController

  final _currentIndex = 0.obs;
  get currentIndex => _currentIndex.value;
  void onClick(int val) => _currentIndex.value = val;
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    Get.delete<NavigationController>();
  }
}
