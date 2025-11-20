
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class PhoneMode {

    
Future<String?> getUserPhone() async {
  try {
      User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;

    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (doc.exists) {
      return doc['phone'];
    } else {
      return null;
    }
  } catch (e) {
    print("Error getting phone: $e");
    return null;
  }
}

Future<void> updateUserPhone(String phone) async {
  try {

      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) return;
    await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
      'phone': phone,
    });

  } catch (e) {
    print("Error updating phone: $e");
  }
}


}
