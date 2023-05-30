import 'package:get/get.dart';

class NavigationController extends GetxController {
  //

  final _currentIndex = 0.obs;
  get currentIndex => _currentIndex.value;
  void onClick(int val) => _currentIndex.value = val;
  @override
  void onClose() {
    // TODO: implement onClose
    _currentIndex.close();
    Get.delete<NavigationController>();
    super.onClose();
  }
}
