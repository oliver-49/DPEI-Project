
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class DoneSetup {

    
Future<String?> setDone() async {
  try {
      User? user = FirebaseAuth.instance.currentUser;
      FirebaseFirestore _firestore = FirebaseFirestore.instance;
    if (user == null) return null;
     await _firestore.collection('users').doc(user.uid).update({
        'allsetup':true
      });

      return "success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }

  
  
}



}
