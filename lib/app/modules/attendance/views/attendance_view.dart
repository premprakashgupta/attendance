import 'package:attendance/app/data/data.dart';
import 'package:attendance/widgets/caption_text.dart';
import 'package:attendance/widgets/subHeader_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/attendance_controller.dart';

class AttendanceView extends GetView<AttendanceController> {
  const AttendanceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AttendanceView'),
          actions: !CustomeData.student
              ? [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Create"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Old Attendance"),
                    ),
                  )
                ]
              : null,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {},
                  title: const CustomeSubHeader(text: 'Prem prakash'),
                  subtitle: const Text('19105109004'),
                  trailing: CustomeData.student
                      ? const CustomeCaption(
                          text: 'Present',
                          color: Colors.green,
                        )
                      : Checkbox(value: true, onChanged: (value) {}),
                );
              }),
        ));
  }
}
