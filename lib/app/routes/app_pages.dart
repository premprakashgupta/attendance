import 'package:get/get.dart';

import '../modules/assignment/bindings/assignment_binding.dart';
import '../modules/assignment/pdfpage/bindings/pdfpage_binding.dart';
import '../modules/assignment/pdfpage/views/pdfpage_view.dart';
import '../modules/assignment/views/assignment_view.dart';
import '../modules/attendance/bindings/attendance_binding.dart';
import '../modules/attendance/views/attendance_view.dart';
import '../modules/auth/middleware/auth_middleware.dart';
import '../modules/landing/bindings/landing_binding.dart';
import '../modules/landing/views/landing_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 300),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.LANDING,
      page: () => LandingView(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 300),
      binding: LandingBinding(),
      middlewares: [AuthGuardMiddleware()],
    ),
    GetPage(
      name: _Paths.ATTENDANCE,
      page: () => AttendanceView(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 300),
      binding: AttendanceBinding(),
      middlewares: [AuthGuardMiddleware()],
    ),
    GetPage(
      name: _Paths.ASSIGNMENT,
      page: () => const AssignmentView(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 300),
      binding: AssignmentBinding(),
      middlewares: [AuthGuardMiddleware()],
      children: [
        GetPage(
          name: _Paths.PDFPAGE,
          page: () => const PdfpageView(),
          binding: PdfpageBinding(),
          middlewares: [AuthGuardMiddleware()],
        ),
      ],
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
  ];
}
