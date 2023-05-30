import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ClassService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<DocumentSnapshot> getClassStream() {
    return _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .snapshots();
  }

  Future<DocumentSnapshot> getReferencedDocument(DocumentReference reference) {
    return reference.get();
  }

  Future<Map<String, dynamic>?> getUserdata() async {
    DocumentReference<Map<String, dynamic>> ref =
        _firestore.collection("users").doc(_auth.currentUser!.uid);

    DocumentSnapshot<Map<String, dynamic>> res = await ref.get();

    Map<String, dynamic>? docData = res.data() as Map<String, dynamic>;

    docData['userRef'] = ref;
    return docData;
  }

  void createClass({required Map<String, dynamic> data}) async {
    DocumentReference<Map<String, dynamic>> classRefs =
        _firestore.collection("classes").doc(data['classCode']);
    await classRefs.set(data);
    // Assuming your array of class document references is stored in a variable called `classRefs`

    await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
      'classes': FieldValue.arrayUnion([classRefs])
    });
  }

  void joinClass(
      {required String classCode, required Map<String, dynamic> user}) async {
    Map<String, dynamic> classData = {};
    Query<Map<String, dynamic>> classInstance = _firestore
        .collection("classes")
        .where('classCode', isEqualTo: classCode);

    QuerySnapshot<Map<String, dynamic>> data = await classInstance.get();
    if (data.docs.isNotEmpty) {
      var doc = data.docs.first;
      classData = doc.data();
      var teacherRef = doc.data()['teacher'];
      var teacherInst = await teacherRef.get();
      classData['teacher'] = teacherInst.data();

      DocumentReference classRef = _firestore.collection("classes").doc(doc.id);

      await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
        'classes': FieldValue.arrayUnion([classRef])
      });
      await _firestore.collection('classes').doc(doc.id).update({
        'students': FieldValue.arrayUnion([user['userRef']])
      });
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAttendanceStream(
      {required String classCode}) {
    return _firestore
        .collection('classes')
        .doc(classCode)
        .collection('attendance')
        .orderBy('createAt')
        .limit(1)
        .snapshots();
  }

  void creatAttendance({required String classCode}) async {
    var classInst = await _firestore
        .collection('classes')
        .where('classCode', isEqualTo: classCode)
        .get();
    if (classInst.docs.isNotEmpty) {
      var classDocId = classInst.docs.first.id;
      List<Map<String, dynamic>> attendance = [];
      for (var student in classInst.docs.first.data()['students']) {
        attendance.add({'studentData': student, 'present': false});
      }
      await _firestore
          .collection('classes')
          .doc(classDocId)
          .collection('attendance')
          .add({'students': attendance, 'createAt': Timestamp.now()});
    }
  }

  void makeAttendance(
      {required String classCode,
      required DocumentReference studentData}) async {
    var attendanceQuerySnapshot = await _firestore
        .collection('classes')
        .doc(classCode)
        .collection('attendance')
        .orderBy('createAt', descending: true)
        .limit(1)
        .get();

    if (attendanceQuerySnapshot.docs.isNotEmpty) {
      var attendanceDocId = attendanceQuerySnapshot.docs.first.id;

      await _firestore
          .collection('classes')
          .doc(classCode)
          .collection('attendance')
          .doc(attendanceDocId)
          .update({
        'students': FieldValue.arrayRemove([
          {'studentData': studentData, 'present': false}
        ])
      });

      await _firestore
          .collection('classes')
          .doc(classCode)
          .collection('attendance')
          .doc(attendanceDocId)
          .update({
        'students': FieldValue.arrayUnion([
          {'studentData': studentData, 'present': true}
        ])
      });
    }
  }
}
