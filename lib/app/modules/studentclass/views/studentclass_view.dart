import 'package:attendance/app/data/students.dart';
import 'package:attendance/app/modules/auth/controllers/auth_controller.dart';
import 'package:attendance/app/routes/app_pages.dart';
import 'package:attendance/widgets/caption_text.dart';
import 'package:attendance/widgets/header_text.dart';
import 'package:attendance/widgets/subHeader_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/studentclass_controller.dart';

enum SampleItem {
  assignment,
  attendance,
}

class StudentclassView extends GetView<StudentClassController> {
  StudentclassView({Key? key}) : super(key: key);
  final bool student = true;
  final StudentClassController _studentClassController =
      Get.find<StudentClassController>();
  final AuthController _authController = Get.find<AuthController>();
  final TextEditingController _className = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classes'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => _studentClassController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : TextButton.icon(
                      onPressed: () {
                        final role =
                            _authController.userData!.values.first['role'];
                        if (role == 'student') {
                          _dialog(role: role);
                        } else {
                          // Handle 'Create' action
                        }
                      },
                      icon: const Icon(Icons.add),
                      label: CustomeSubHeader(
                        text: _authController.userData!.values.first['role'] ==
                                'student'
                            ? "Join"
                            : "Create",
                      ),
                    ),
            ),
          )
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => _studentClassController.isLoading == true
              ? const Center(child: CircularProgressIndicator())
              : Center(
                  child: ListView.builder(
                    itemCount: _studentClassController.classes.length,
                    itemBuilder: (context, index) {
                      var data = _studentClassController.classes[index];

                      return Card(
                        child: Stack(children: [
                          Container(
                            height: 120,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: DataBase.classes[index]['background'] != ''
                                  ? DataBase.classes[index]['background']
                                  : Colors.transparent,
                            ),
                            child: DataBase.classes[index]['image'] != ''
                                ? CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: DataBase.classes[index]['image'])
                                : null,
                          ),
                          Positioned(
                            top: 10,
                            left: 10,
                            child: CustomeHeader(
                              text: data['className'],
                              color: Colors.white,
                            ),
                          ),
                          const Positioned(
                            top: 40,
                            left: 10,
                            child: CustomeSubHeader(
                              text: '11:00 PM',
                              color: Colors.white,
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: Row(
                              children: [
                                CustomeCaption(
                                  text: data['classCode'].toString(),
                                  color: Colors.white,
                                ),
                                const Gap(10),
                                CustomeCaption(
                                  text: data['teacher']['username'],
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            child: _popUpmenu(),
                            top: 10,
                            right: 10,
                          )
                        ]),
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }

  _dialog({required String role}) {
    print(role);
    return Get.defaultDialog(
      title: role == 'student' ? 'Join Class' : 'Create Class',
      onConfirm: () {
        if (role == 'student') {
        } else {
          _studentClassController.createClass(
              className: _className.text, userData: _authController.userData);
        }
        _className.text = '';
      },
      onCancel: () {},
      radius: 5,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      content: Column(
        children: [
          CustomeCaption(
              text: role == 'student'
                  ? 'New class will be joined after putting class code and click on ok. you will get access of class .'
                  : 'New class will be created after naming and click on ok. you will get class code and can share with anyone to join class '),
          TextFormField(
            controller: _className,
            decoration: InputDecoration(
              hintText: role == 'student' ? "Class Code" : "Class Name",
              label: Text(role == 'student' ? "Class Code" : "Class Name"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _popUpmenu() {
    return PopupMenuButton<SampleItem>(
      // Callback that sets the selected popup menu item.
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      onSelected: (SampleItem item) {
        switch (item) {
          case SampleItem.assignment:
            Get.toNamed(Routes.ASSIGNMENT);
            break;
          case SampleItem.attendance:
            Get.toNamed(Routes.ATTENDANCE);
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        PopupMenuItem<SampleItem>(
          onTap: () {
            // Get.toNamed(Routes.ASSIGNMENT);
          },
          value: SampleItem.assignment,
          child: const Text('Assignment'),
        ),
        PopupMenuItem<SampleItem>(
          onTap: () async {},
          value: SampleItem.attendance,
          child: const Text('Attendance'),
        ),
      ],
    );
  }
}
