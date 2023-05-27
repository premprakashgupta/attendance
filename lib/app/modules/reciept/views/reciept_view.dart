import 'package:attendance/app/modules/reciept/invoice/invoice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/reciept_controller.dart';

class RecieptView extends GetView<RecieptController> {
  RecieptView({Key? key}) : super(key: key);
  final List<int> years = List<int>.generate(
    DateTime.now().year - 2019,
    (index) => DateTime.now().year - index,
  );
  final TextEditingController _yearController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RecieptView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButtonFormField<int>(
                value: _yearController.text.isNotEmpty
                    ? int.parse(_yearController.text)
                    : null,
                items: years.map((int year) {
                  return DropdownMenuItem<int>(
                    value: year,
                    child: Text(year.toString()),
                  );
                }).toList(),
                onChanged: (int? value) {
                  _yearController.text = value.toString();
                },
                decoration: const InputDecoration(
                  labelText: 'Choose Year',
                  border: OutlineInputBorder(),
                ),
              ),
              const Gap(40),
              !GetPlatform.isWindows
                  ? SizedBox(
                      height: 400,
                      width: 300,
                      child: const PDF().fromAsset('assets/example.pdf'))
                  : const Text(
                      'Please prefer mobile device Android/Ios to see preview of reciept'),
              const Gap(40),
              ElevatedButton(
                onPressed: () {
                  GeneratePdf().generatepdf();
                },
                child: const Text('Generate'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
