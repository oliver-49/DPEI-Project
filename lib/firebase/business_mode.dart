
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class BusinessMode {

    
Future<String?> setUserBusiness({required String business_name,required String address}) async {
  try {
      User? user = FirebaseAuth.instance.currentUser;
      FirebaseFirestore _firestore = FirebaseFirestore.instance;
    if (user == null) return null;
     await _firestore.collection('users').doc(user.uid).update({
        'business name': business_name,
        'business address': address,
      });

      return "success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }

  
  
}
Future<String?> getUserBusinessName() async {
  try {
      User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;

    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (doc.exists) {
      return doc['business name'];
    } else {
      return null;
    }
  } catch (e) {
    print("Error getting business name: $e");
    return null;
  }
}Future<String?> getUserBusinessAddress() async {
  try {
      User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;

    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (doc.exists) {
      return doc['business address'];
    } else {
      return null;
    }
  } catch (e) {
    print("Error getting business address: $e");
    return null;
  }
}

Future<void> updateUserBusiness(String? new_business_name,String? new_address) async {
  try {

      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) return;
    await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
      'business name': new_business_name,
      'business address': new_address,
    });

  } catch (e) {
    print("Error updating phone: $e");
  }
}


}
