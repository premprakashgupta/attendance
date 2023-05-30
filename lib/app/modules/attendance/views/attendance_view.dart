import 'package:attendance/app/data/data.dart';
import 'package:attendance/app/modules/auth/controllers/auth_controller.dart';
import 'package:attendance/widgets/caption_text.dart';
import 'package:attendance/widgets/header_text.dart';
import 'package:attendance/widgets/subHeader_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/attendance_controller.dart';

class AttendanceView extends GetView<AttendanceController> {
  AttendanceView({Key? key}) : super(key: key);
  final AttendanceController _attendanceController =
      Get.find<AttendanceController>();
  final AuthController _authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('AttendanceView'), actions: [
          Obx(() => _authController.isLoading
              ? const CircularProgressIndicator()
              : _authController.userData!['role'] == 'teacher'
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _attendanceController.createAttendance();
                        },
                        child: const Text("Create"),
                      ),
                    )
                  : const SizedBox())
        ]),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => _attendanceController.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : _attendanceController.attendanceStream.isEmpty
                    ? const CustomeHeader(text: 'No data Found')
                    : ListView.builder(
                        itemCount:
                            _attendanceController.attendanceStream.length,
                        itemBuilder: (context, index) {
                          var data =
                              _attendanceController.attendanceStream[index];

                          // return SizedBox();
                          return ListTile(
                            onTap: () {},
                            title: CustomeSubHeader(
                                text: data['studentData']['username']),
                            subtitle: Text(data['studentData']['id']),
                            trailing: CustomeData.student
                                ? const CustomeCaption(
                                    text: 'Present',
                                    color: Colors.green,
                                  )
                                : data['present']
                                    ? const Text("Present")
                                    : ElevatedButton(
                                        onPressed: () {
                                          _attendanceController.makeAttendance(
                                              studentData: data['userRef']);
                                        },
                                        child: const Text('Done'),
                                      ),
                          );
                        },
                      ),
          ),
        ));
  }
}
