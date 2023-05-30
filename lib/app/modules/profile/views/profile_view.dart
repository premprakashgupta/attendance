import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);
  final ProfileController _profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    // Replace with your avatar image
                    backgroundImage: AssetImage('assets/avatar.png'),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'johndoe@example.com',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: 5, // Replace with the actual number of list items
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('List Tile $index'),
                  onTap: () {
                    // Perform action when the list tile is tapped
                  },
                );
              },
            ),
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              // Perform action when the settings tile is tapped
            },
          ),
          ListTile(
            title: const Text('Privacy'),
            onTap: () {
              // Perform action when the privacy tile is tapped
            },
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              // Perform logout action
              _profileController.logout();
            },
          ),
        ],
      ),
    );
  }
}
