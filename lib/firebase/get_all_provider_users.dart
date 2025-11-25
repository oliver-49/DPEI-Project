import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixit/userModel/service_provider_model.dart';

class ProviderService{
  
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ServiceProviderModel>> getAllServiceProviders() async {
  try {
    QuerySnapshot querySnapshot = await _firestore
        .collection('users')
        .where('role', isEqualTo: 'provider')
        .get();

    // Convert query results → List<ServiceProviderModel>
    List<ServiceProviderModel> providers = querySnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return ServiceProviderModel.fromMap(data, uid: doc.id);
    }).toList();

    print("Loaded ${providers.length} service providers");
    return providers;

  } catch (e) {
    print("Error fetching service providers: $e");
    return [];
  }
}
}
