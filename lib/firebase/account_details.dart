
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AccountDetailsData {

    
Future<String?> setUserAccountDetailsData({required String ownerName,required String nicNumber}) async {
  try {
      User? user = FirebaseAuth.instance.currentUser;
      FirebaseFirestore _firestore = FirebaseFirestore.instance;
    if (user == null) return null;
     await _firestore.collection('users').doc(user.uid).update({
        'ownerName': ownerName,
        'nicNumber': nicNumber,
        
      });

      return "success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }

  
  
}
Future<String?> getUserAccountDetailsName() async {
  try {
      User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;

    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (doc.exists) {
      return doc['Service'];
    } else {
      return null;
    }
  } catch (e) {
    print("Error getting Service: $e");
    return null;
  }
}

Future<String?> getUserAccountDetailsnicNumber() async {
  try {
      User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;

    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (doc.exists) {
      return doc['Experience Year'];
    } else {
      return null;
    }
  } catch (e) {
    print("Error getting Experience Year: $e");
    return null;
  }
}




}
