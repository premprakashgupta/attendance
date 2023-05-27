import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SubmittedView extends GetView {
  const SubmittedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'SubmittedView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
