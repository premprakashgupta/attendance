import 'package:attendance/app/modules/profile/controllers/profile_controller.dart';
import 'package:attendance/app/modules/reciept/controllers/reciept_controller.dart';
import 'package:attendance/app/modules/studentclass/controllers/studentclass_controller.dart';
import 'package:attendance/app/services/class_services.dart';
import 'package:get/get.dart';
import 'package:attendance/app/modules/landing/controllers/slider_controller.dart';

import 'package:attendance/app/modules/landing/controllers/navigation_controller.dart';

import '../controllers/landing_controller.dart';

class LandingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(
      () => NavigationController(),
    );
    Get.lazyPut<SliderController>(
      () => SliderController(),
    );
    Get.lazyPut<LandingController>(
      () => LandingController(),
    );
    Get.lazyPut<RecieptController>(
      () => RecieptController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<ClassService>(
      () => ClassService(),
    );
    Get.lazyPut<StudentClassController>(
      () => StudentClassController(),
    );
  }
}
