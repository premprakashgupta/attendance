import 'package:attendance/app/services/class_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';

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

    _classService.getClassesStream().listen(
      (docs) async {
        List<Map<String, dynamic>> temp = [];
        for (var doc in docs) {
          DocumentReference? reference = doc.get('teacher');
          if (reference != null) {
            DocumentSnapshot referencedDoc =
                await _classService.getReferencedDocument(reference);

            Map<String, dynamic> docData = doc.data() as Map<String, dynamic>;
            Map<String, dynamic> referencedDocData =
                referencedDoc.data() as Map<String, dynamic>;
            docData['teacher'] = referencedDocData;
            // print(docData);
            temp.add(docData);
          }
        }

        classes.value = temp;
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
      'classCode': randomAlphaNumeric(5),
      'image': ''
    };

    try {
      _classService.createClass(data: data);
      classes.add({'className': className, 'teacher': userData});
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
