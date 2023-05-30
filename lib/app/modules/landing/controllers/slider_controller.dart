import 'package:get/get.dart';

class SliderController extends GetxController {
  //
  final RxInt _pageIndex = 0.obs;
  get pageIndex => _pageIndex.value;

  void pageIndexFunc({required int value}) {
    _pageIndex.value = value;
  }

  @override
  void onClose() {
    _pageIndex.close();
    Get.delete<SliderController>();
    super.onClose();
  }
}
