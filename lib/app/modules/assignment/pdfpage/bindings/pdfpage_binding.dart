import 'package:get/get.dart';

import '../controllers/pdfpage_controller.dart';

class PdfpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PdfpageController>(
      () => PdfpageController(),
    );
  }
}
