import 'dart:io';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

class AssignmentController extends GetxController {
  final Rx<File?> _selectedFile = Rx<File?>(null);
  final RxBool _isError = RxBool(false);
  final _size = 0.obs;
  final _name = ''.obs;
  get selectedFile => _selectedFile.value;
  get size => _size.value;
  get isError => _isError.value;
  get name => _name.value;

  void chooseFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      PlatformFile filedetail = result.files.first;

      File file = File(result.files.single.path!);
      _selectedFile.value = file;
      _size.value = filedetail.size;
      _name.value = filedetail.name;
    } else {
      _isError.value = true;
    }
  }
}
