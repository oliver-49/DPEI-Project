

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  
    Future<String?> getUserUid() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        return user.uid;
      } else {
        return null; // No user is signed in
      }
    } catch (e) {
      print('Error getting user UID: $e');
      return null;
    }
  }

  // ====================== SIGN UP ======================
  Future<String?> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      // Create user
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = userCredential.user!.uid;

      // Create user document in Firestore
      await _firestore.collection('users').doc(uid).set({
        'uid': uid,
        'email': email,
        'name': name,
        'phone': phone,
        'createdAt': DateTime.now(),
        'role':'not-detect'
      });

      return "success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // ====================== SIGN IN ======================
  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // ====================== SIGN OUT ======================
  Future<void> signOut() async {
    await _auth.signOut();
  }
}

