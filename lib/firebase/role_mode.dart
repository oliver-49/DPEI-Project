
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class RoleMode {

    
Future<String?> getUserRole() async {
  try {
      User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;

    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (doc.exists) {
      return doc['role'];
    } else {
      return null;
    }
  } catch (e) {
    print("Error getting role: $e");
    return null;
  }
}

Future<void> updateUserRole(String role) async {
  try {

      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) return;
    await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
      'role': role,
    });

  } catch (e) {
    print("Error updating role: $e");
  }
}


}
