import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixit/userModel/service_provider_model.dart';


class ServiceProviderService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addServiceProvider(ServiceProviderModel model) async {
    try {
      await _firestore.collection('users').doc(model.uid).set(
        model.toMapForFirestore(),
        SetOptions(merge: true), // مهم لو بتحب تحدث بدل ما تستبدل كل الداتا
      );
      print("Service provider added successfully");
    } catch (e) {
      print("Error adding service provider: $e");
      rethrow;
    }
  }
}
