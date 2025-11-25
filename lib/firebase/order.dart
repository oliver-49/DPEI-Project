import 'package:cloud_firestore/cloud_firestore.dart';
class Order{
  
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    Future<String> create(
      String? userUId,
      String? providerUId,

      String name,
      String type,
      String salary,
      String fullAddress,
      String homeNo,
      String streetNo,
      DateTime? date,
      String time,
    
    ) async {
    try {
      await _firestore.collection('orders').doc("$userUId-$providerUId")
      .collection('Orders').doc().set({
        'user-uid': userUId,
        'provider-uid': providerUId,
        'createdAt': DateTime.now(),
        'status':'pending',

        'name': name,
        'type': type,
        'salary': salary,
        'fullAddress': fullAddress,
        'homeNo': homeNo,
        'streetNo': streetNo,
        'date': date,
        'time': time,

      });
  
      return "success";
    }catch (e) {
      String massege="Error adding order: $e";
      print(massege);
      return massege;
    }
  }
  
}