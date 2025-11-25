import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixit/userModel/service_provider_model.dart';

class ServiceProviderService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // -------------------------
  // GET SERVICE PROVIDER
  // -------------------------
  Future<ServiceProviderModel> getServiceProvider(String uid) async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection('users').doc(uid).get();

      if (!snapshot.exists) {
        print("No service provider found with uid: $uid");
        return ServiceProviderModel(uid: uid);
      }

      final data = snapshot.data() as Map<String, dynamic>;

      // تحويل الـ Map إلى Model
      ServiceProviderModel model =
          ServiceProviderModel.fromMap(data, uid: uid);

      print("Service provider loaded successfully:");
      print(model.toString());

      return model;

    } catch (e) {
      print("Error fetching service provider: $e");
      return ServiceProviderModel(uid: uid);
    }
  }

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
