import 'package:attendance/app/modules/auth/controllers/auth_controller.dart';
import 'package:attendance/app/routes/app_pages.dart';
import 'package:attendance/utils/colors.dart';
import 'package:attendance/widgets/caption_text.dart';
import 'package:attendance/widgets/header_text.dart';
import 'package:attendance/widgets/subHeader_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              () => _authController.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : TextButton.icon(
                      onPressed: () {
                        final role = _authController.userData!['role'];
                        final user = _authController.userData!;

                        _dialog(role: role, user: user);
                      },
                      icon: const Icon(Icons.add),
                      label: CustomeSubHeader(
                        text: _authController.userData!['role'] == 'student'
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
              : _studentClassController.classes.isEmpty
                  ? const CustomeHeader(text: 'No Data Found')
                  : Center(
                      child: ListView.builder(
                        itemCount: _studentClassController.classes.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> data =
                              _studentClassController.classes[index];

                          return Card(
                            child: Stack(children: [
                              Container(
                                height: 140,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: data['background'] != ''
                                      ? CustomeColors.getColorFromHexString(
                                          data['background'])
                                      : Colors.black45,
                                ),
                              ),
                              Positioned(
                                top: 10,
                                left: 10,
                                child: SizedBox(
                                  width: 250,
                                  child: CustomeHeader(
                                    text: data['className'],
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Positioned(
                                bottom: 5,
                                left: 5,
                                child: CustomeSubHeader(
                                  text: '11:00 PM',
                                  color: Colors.white,
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: Row(
                                  children: [
                                    _authController.userData!['role'] ==
                                            'teacher'
                                        ? TextButton.icon(
                                            onPressed: () async {
                                              await Clipboard.setData(
                                                ClipboardData(
                                                  text: data['classCode']
                                                      .toString(),
                                                ),
                                              );
                                              // copied successfully
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                      'copied successfully'),
                                                  duration: Duration(
                                                      seconds:
                                                          2), // Optional duration
                                                ),
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.copy,
                                              size: 17,
                                              color: Colors.white,
                                            ),
                                            label: const CustomeCaption(
                                              text: 'Class Code',
                                              color: Colors.white,
                                            ),
                                          )
                                        : const SizedBox(),
                                    const Gap(10),
                                    Column(
                                      children: [
                                        CustomeCaption(
                                          text: data['teacher']['username'],
                                          color: Colors.white,
                                        ),
                                        Text(
                                          data['teacher']['username'],
                                          style: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.white),
                                          maxLines: 1,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: _popUpmenu(classCode: data['classCode']),
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

  _dialog({required String role, required Map<String, dynamic> user}) {
    return Get.defaultDialog(
      title: role == 'student' ? 'Join Class' : 'Create Class',
      onConfirm: () {
        if (role == 'student') {
          _studentClassController.joinClass(
              classCode: _className.text, user: user);
        } else {
          _studentClassController.createClass(
              className: _className.text, userData: _authController.userData);
        }
        _className.text = '';
        Get.back();
      },
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

  Widget _popUpmenu({required String classCode}) {
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
            Get.toNamed(Routes.ATTENDANCE,
                parameters: {'classCode': classCode});
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
