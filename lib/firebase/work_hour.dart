
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class WorkHourMode {

    
Future<String?> setUserWorkHour({required TimeOfDay startingTime,required TimeOfDay endingTime}) async {
  try {
      User? user = FirebaseAuth.instance.currentUser;
      FirebaseFirestore _firestore = FirebaseFirestore.instance;
    if (user == null) return null;
    String formatTime(TimeOfDay t) {
  final hour = t.hour.toString().padLeft(2, '0');
  final minute = t.minute.toString().padLeft(2, '0');
  return '$hour:$minute';
}

     await _firestore.collection('users').doc(user.uid).update({
        'Starting Time': formatTime(startingTime),
        'Ending Time': formatTime(endingTime),
      });

      return "success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }

  
  
}
Future<String?> getUserStartingWorkHour() async {
  try {
      User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;

    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (doc.exists) {
      return doc['Starting Time'];
    } else {
      return null;
    }
  } catch (e) {
    print("Error getting Starting Time: $e");
    return null;
  }
}Future<String?> getUserEndingWorkHour() async {
  try {
      User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;

    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (doc.exists) {
      return doc['Ending Time'];
    } else {
      return null;
    }
  } catch (e) {
    print("Error getting Ending Time: $e");
    return null;
  }
}

Future<void> updateUserBusiness(TimeOfDay? startingTime,TimeOfDay? endingTime) async {
  try {

      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) return;
    await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        'Starting Time': startingTime,
        'Ending Time': endingTime,
      });

  } catch (e) {
    print("Error updating phone: $e");
  }
}


}
