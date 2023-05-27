import 'package:attendance/app/modules/reciept/views/reciept_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:attendance/app/modules/home/views/home_view.dart';
import 'package:attendance/app/modules/landing/controllers/navigation_controller.dart';
import 'package:attendance/app/modules/notifications/views/notifications_view.dart';
import 'package:attendance/app/modules/profile/views/profile_view.dart';
import 'package:attendance/app/modules/studentclass/views/studentclass_view.dart';
import 'package:attendance/utils/colors.dart';

import '../controllers/landing_controller.dart';

class LandingView extends GetView<LandingController> {
  LandingView({Key? key}) : super(key: key);
  final NavigationController _navigationController =
      Get.find<NavigationController>();
  final List<Widget> screens = [
    HomeView(),
    StudentclassView(),
    RecieptView(),
    const NotificationsView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: CustomeColors.mainclr,
            unselectedItemColor: CustomeColors.shadow,
            currentIndex: _navigationController.currentIndex,
            onTap: (int index) {
              _navigationController.onClick(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home",
                activeIcon: Icon(Icons.home_sharp),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.groups_2_outlined),
                label: "Class",
                activeIcon: Icon(Icons.groups_2_sharp),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.print_outlined),
                label: "Reciept",
                activeIcon: Icon(Icons.print_sharp),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined),
                label: "Notifications",
                activeIcon: Icon(Icons.notifications_sharp),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: "Profile",
                activeIcon: Icon(Icons.account_circle_sharp),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            for (var i = 0; i < screens.length; i++)
              Obx(
                () => Visibility(
                  visible: _navigationController.currentIndex == i,
                  maintainState: true,
                  child: screens[i],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
