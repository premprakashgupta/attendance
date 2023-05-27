import 'package:attendance/app/modules/assignment/controllers/assignment_controller.dart';
import 'package:attendance/widgets/caption_text.dart';
import 'package:attendance/widgets/header_text.dart';
import 'package:attendance/widgets/shadow_container.dart';
import 'package:attendance/widgets/subHeader_text.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

class UploadTaskView extends GetView {
  UploadTaskView({Key? key}) : super(key: key);
  final AssignmentController _assignmentController =
      Get.find<AssignmentController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Center(
            child: Column(
              children: [
                const Gap(30),
                _assignmentController.selectedFile != null
                    ? CustomContainer(
                        padding: const EdgeInsets.all(18),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomeSubHeader(
                                  text: _assignmentController.name),
                              CustomeCaption(
                                text: _assignmentController.size.toString(),
                              )
                            ]),
                      )
                    : const CustomeSubHeader(text: 'Choose pdf file only'),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () async {
                        _assignmentController.chooseFile();
                      },
                      child: const Text('Choose File'),
                    ),
                    const Gap(10),
                    ElevatedButton(
                      onPressed: _assignmentController.selectedFile == null
                          ? null
                          : () {},
                      child: const Text('UPLOAD'),
                    )
                  ],
                ),
                const Gap(20),
                const CustomeHeader(text: 'Your Uploaded Task'),
                const Gap(10),
                Expanded(
                  child: ListView.builder(
                      itemCount: 30,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {},
                          leading: const Icon(Icons.check_circle),
                          title: const CustomeSubHeader(
                              text: 'Discrete Mathematics Assignment'),
                          subtitle: Text(
                              DateTime.now().toIso8601String().split('T')[0]),
                          trailing: Text(
                              DateTime.now().toIso8601String().split('T')[0]),
                        );
                      }),
                )
              ],
            ),
          )),
    );
  }
}
