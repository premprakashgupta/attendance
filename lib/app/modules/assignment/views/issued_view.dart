import 'package:attendance/app/routes/app_pages.dart';
import 'package:attendance/widgets/subHeader_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class IssuedView extends GetView {
  const IssuedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Get.toNamed(Routes.PDFPAGE);
                },
                leading: const Icon(Icons.check_circle),
                title: const CustomeSubHeader(
                    text: 'Discrete Mathematics Assignment'),
                subtitle: Text(DateTime.now().toIso8601String().split('T')[0]),
                trailing: Text(DateTime.now().toIso8601String().split('T')[0]),
              );
            }),
      ),
    );
  }
}
