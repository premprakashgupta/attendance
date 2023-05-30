import 'package:attendance/app/services/class_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AttendanceController extends GetxController {
  final ClassService _classService = ClassService();
  final _attendanceStream = <Map<String, dynamic>>[].obs;
  final _isLoading = false.obs;
  List<Map<String, dynamic>> get attendanceStream => _attendanceStream;
  bool get isLoading => _isLoading.value;
  @override
  void onInit() {
    super.onInit();
    _isLoading.value = true;
    String? classCode = Get.parameters['classCode'];
    // Use the classCode parameter in your logic
    if (classCode == null) {
      Get.snackbar('Class Code Error', 'Class Code parameter required');
    } else {
      fetchAttendance(classCode: classCode);
    }
  }

  void fetchAttendance({required String classCode}) {
    _classService
        .getAttendanceStream(classCode: classCode)
        .listen((docs) async {
      List<Map<String, dynamic>> attendanceList = [];
      if (docs.docs.isEmpty) {
        _isLoading.value = false;
        return;
      }

      for (var doc in docs.docs.first.data()['students']) {
        var studentRef = doc['studentData'];

        var studentData = await studentRef.get();

        doc['studentData'] = studentData.data();
        doc['userRef'] = studentRef;
        attendanceList.add(doc);
      }

      _attendanceStream.assignAll(attendanceList);
      _isLoading.value = false;
    });
  }

  void createAttendance() {
    String? classCode = Get.parameters['classCode'];
    _classService.creatAttendance(classCode: classCode!);
  }

  void makeAttendance({required DocumentReference studentData}) {
    String? classCode = Get.parameters['classCode'];
    _classService.makeAttendance(
        classCode: classCode!, studentData: studentData);
  }
}
