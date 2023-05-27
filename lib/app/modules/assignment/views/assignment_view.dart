import 'package:attendance/app/modules/assignment/views/issued_view.dart';
import 'package:attendance/app/modules/assignment/views/upload_task_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/assignment_controller.dart';

class AssignmentView extends GetView<AssignmentController> {
  const AssignmentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('AssignmentView'),
          centerTitle: true,
          bottom: const TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(
                text: "Issued",
              ),
              Tab(
                text: "Upload",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [const IssuedView(), UploadTaskView()],
        ),
      ),
    );
  }
}
