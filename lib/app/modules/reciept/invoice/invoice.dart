import 'dart:io';

import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';

class GeneratePdf {
  final List<Map<String, dynamic>> tableData = [
    {'month': 'January', 'fee': 100, 'status': 'Paid', 'date': '2023-01-05'},
    {'month': 'February', 'fee': 120, 'status': 'Paid', 'date': '2023-02-10'},
    {'month': 'March', 'fee': 110, 'status': 'Pending', 'date': '2023-03-15'},
  ];
  void generatepdf() async {
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      final pdf = pw.Document();

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.Text(
                    'Nalanda College of Engineering, chandi',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Text('email: beubihar@gmail.com'),
                  pw.SizedBox(height: 10),
                  pw.Divider(height: 2),
                  pw.SizedBox(height: 20),
                  pw.Text(
                    'Dear Premprakash Gupta,',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Text(
                    'We would like to express our sincere gratitude for your prompt payment of the tuition fee for the month of January 2023. Your timely contribution is greatly appreciated and plays a vital role in supporting our educational services.',
                  ),
                  pw.SizedBox(height: 30),
                  DynamicTable(data: tableData),
                ]); // Center
          },
        ),
      );

      final output = await getTemporaryDirectory();
      final file = File("${output.path}/example.pdf");

      await file.writeAsBytes(
        await pdf.save(),
      );
      // Open the file for download
      if (await file.exists()) {
        final filePath = file.path;

        await OpenFile.open(filePath);
      }
    } else if (status.isDenied) {
      Get.snackbar("Storage Permission", "Storage Permission denied");
    } else if (status.isPermanentlyDenied) {
      // Permission permanently denied
      // Show a dialog or error message with instructions to grant the permission from device settings
    }
  }
}

class DynamicTable extends pw.StatelessWidget {
  final List<Map<String, dynamic>> data;

  DynamicTable({required this.data});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Table.fromTextArray(
      headers: ['Month', 'Fee', 'Status', 'Date'],
      data: data.map((item) {
        return [
          item['month'],
          item['fee'].toString(),
          item['status'],
          item['date']
        ];
      }).toList(),
      headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
      cellStyle: const pw.TextStyle(),
      headerDecoration: pw.BoxDecoration(
        borderRadius: pw.BorderRadius.circular(2),
        color: PdfColors.grey300,
      ),
      border: pw.TableBorder.all(color: PdfColors.grey),
      headerAlignment: pw.Alignment.centerLeft,
      cellAlignment: pw.Alignment.centerLeft,
      cellAlignments: {
        0: pw.Alignment.centerLeft,
        1: pw.Alignment.centerLeft,
        2: pw.Alignment.centerLeft,
        3: pw.Alignment.centerLeft,
      },
    );
  }
}
