import 'package:attendance/app/modules/auth/controllers/auth_controller.dart';
import 'package:attendance/widgets/subHeader_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);
  final ProfileController _profileController = Get.find<ProfileController>();
  final AuthController _authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => _authController.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 50.0,
                          // Replace with your avatar image
                          backgroundImage: NetworkImage(
                              "https://e7.pngegg.com/pngimages/84/165/png-clipart-united-states-avatar-organization-information-user-avatar-service-computer-wallpaper-thumbnail.png"),
                        ),
                        const Gap(16),
                        CustomeSubHeader(
                          text: _authController.userData!['username'],
                        ),
                        const Gap(8.0),
                        const Text(
                          'johndoe@example.com',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                ListTile(
                  leading: const Icon(Icons.settings_outlined),
                  title: const Text('Settings'),
                  trailing: const Icon(Icons.chevron_right_sharp),
                  onTap: () {
                    // Perform action when the settings tile is tapped
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.privacy_tip_outlined),
                  title: const Text('Privacy'),
                  trailing: const Icon(Icons.chevron_right_sharp),
                  onTap: () {
                    // Perform action when the privacy tile is tapped
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout_outlined),
                  title: const Text('Logout'),
                  onTap: () {
                    // Perform logout action
                    _profileController.logout();
                  },
                ),
              ],
            ),
    ));
  }
}
