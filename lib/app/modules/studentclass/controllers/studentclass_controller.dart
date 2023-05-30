import 'package:attendance/app/services/class_services.dart';
import 'package:attendance/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class StudentClassController extends GetxController {
  final ClassService _classService = Get.find<ClassService>();
  RxList<Map<String, dynamic>> classes = RxList<Map<String, dynamic>>([]);
  RxBool isLoading = RxBool(false);
  RxString errorMessage = RxString('');

  @override
  void onInit() {
    super.onInit();
    fetchClasses();
  }

  void fetchClasses() {
    isLoading.value = true;
    errorMessage.value = '';

    _classService.getClassStream().listen(
      (doc) async {
        List<Map<String, dynamic>> classesData = [];
        if (!doc.exists) {
          isLoading.value = false;
          return;
        }
        for (var classRef in (doc.data() as Map)['classes']) {
          DocumentSnapshot classSnapshot = await classRef.get();

          Map<String, dynamic> classData =
              classSnapshot.data() as Map<String, dynamic>;

          DocumentReference teacherRef = classData['teacher'];
          DocumentSnapshot teacherSnapshot = await teacherRef.get();

          Map<String, dynamic> teacherData =
              teacherSnapshot.data() as Map<String, dynamic>;

          classData['teacher'] = teacherData;
          classesData.add(classData);
        }

        classes.value = classesData;
        isLoading.value = false;
      },
      onError: (error) {
        errorMessage.value = 'Error fetching classes: $error';
        isLoading.value = false;
      },
    );
  }

  void createClass({required String className, required dynamic userData}) {
    late Map<String, dynamic> data = {
      'className': className,
      'teacher': userData['userRef'],
      'classCode': const Uuid().v4(),
      'background': CustomeColors.getRandomColor().toString()
    };

    try {
      _classService.createClass(data: data);
      classes.add({'className': className, 'teacher': userData});
    } catch (e) {}
  }

  void joinClass(
      {required String classCode, required Map<String, dynamic> user}) async {
    try {
      _classService.joinClass(classCode: classCode, user: user);
    } catch (e) {}
  }

  @override
  void onClose() {
    classes.close();
    isLoading.close();
    errorMessage.close();
    super.onClose();
  }
}
