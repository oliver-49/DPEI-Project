
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class ServiceOfferclassFirebase {

    
Future<String?> setUserOffer({required String service,required String experienceYear,required String serviceArea}) async {
  try {
      User? user = FirebaseAuth.instance.currentUser;
      FirebaseFirestore _firestore = FirebaseFirestore.instance;
    if (user == null) return null;
     await _firestore.collection('users').doc(user.uid).update({
        'Service': service,
        'Experience Year': experienceYear,
        'Service Area': serviceArea,
      });

      return "success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }

  
  
}
Future<String?> getUserBusinessService() async {
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

Future<String?> getUserBusinessExperienceYear() async {
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

Future<String?> getUserBusinessServiceArea() async {
  try {
      User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;

    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (doc.exists) {
      return doc['Service Area'];
    } else {
      return null;
    }
  } catch (e) {
    print("Error getting Service Area: $e");
    return null;
  }
}

Future<void> updateUserBusiness({String? service,String? experienceYear,String? serviceArea}) async {
  try {

      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) return;
    await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        'Service': service,
        'Experience Year': experienceYear,
        'Service Area': serviceArea,
    });

  } catch (e) {
    print("Error updating phone: $e");
  }
}


}
