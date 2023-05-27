import 'package:get/get.dart';

class SliderController extends GetxController {
  //TODO: Implement SliderController
  final RxInt _pageIndex = 0.obs;
  get pageIndex => _pageIndex.value;

  void pageIndexFunc({required int value}) {
    _pageIndex.value = value;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    Get.delete<SliderController>();
  }
}
