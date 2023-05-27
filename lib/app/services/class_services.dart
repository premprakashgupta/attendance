import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ClassService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<DocumentSnapshot>> getClassesStream() {
    return _firestore.collection('classes').snapshots().map(
          (snapshot) => snapshot.docs,
        );
  }

  Future<DocumentSnapshot> getReferencedDocument(DocumentReference reference) {
    return reference.get();
  }

  Future<Map<String, dynamic>?> getUserdata() async {
    var ref = _firestore.collection("users").doc(_auth.currentUser!.uid);

    var res = await ref.get();

    Map<String, dynamic>? docData = res.data() as Map<String, dynamic>;

    docData['userRef'] = ref;
    return docData;
  }

  void createClass({required Map<String, dynamic> data}) async {
    await _firestore.collection("classes").add(data);
  }
}
