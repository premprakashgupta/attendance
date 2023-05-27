import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import 'package:get/get.dart';

import '../controllers/pdfpage_controller.dart';

class PdfpageView extends GetView<PdfpageController> {
  const PdfpageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('PdfpageView'),
        centerTitle: true,
      ),
      body: Center(
        child: !GetPlatform.isWindows
            ? SizedBox(
                height: size.height,
                width: size.width,
                child: const PDF().fromAsset('assets/example.pdf'))
            : const Text(
                'Please prefer mobile device Android/Ios to see preview of reciept'),
      ),
    );
  }
}
