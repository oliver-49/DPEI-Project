// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'service_provider_model.dart';

// class ServiceProviderState extends ChangeNotifier {
//   ServiceProviderModel model;

//   ServiceProviderState({required this.model});

//   // getters (اختياري)
//   ServiceProviderModel get current => model;

//   // setters لكل حقل — تستدعي notifyListeners()
//   void setName(String v) { model.name = v; notifyListeners(); }
//   void setEmail(String v) { model.email = v; notifyListeners(); }
//   void setPhone(String v) { model.phone = v; notifyListeners(); }
//   void setOwnerName(String v) { model.ownerName = v; notifyListeners(); }
//   void setNicNumber(String v) { model.nicNumber = v; notifyListeners(); }
//   void setBusinessName(String v) { model.businessName = v; notifyListeners(); }
//   void setBusinessAddress(String v) { model.businessAddress = v; notifyListeners(); }
//   void setService(String v) { model.service = v; notifyListeners(); }
//   void setServiceArea(String v) { model.serviceArea = v; notifyListeners(); }
//   void setExperienceYear(String v) { model.experienceYear = v; notifyListeners(); }
//   void setStartingTime(String v) { model.startingTime = v; notifyListeners(); }
//   void setEndingTime(String v) { model.endingTime = v; notifyListeners(); }
//   void setAllSetup(bool v) { model.allSetup = v; notifyListeners(); }
//   void setRole(String v) { model.role = v; notifyListeners(); }
//   void setCreatedAt(DateTime v) { model.createdAt = v; notifyListeners(); }

//   // حفظ أو تحديث في Firestore (merge -> true يعني يحدث الحقول الموجودة ويضيف الجديد)
//   Future<void> saveToFirestore() async {
//     final doc = FirebaseFirestore.instance.collection('users').doc(model.uid);
//     final data = model.toMapForFirestore();
//     await doc.set(data, SetOptions(merge: true));
//   }

//   // مسح السجل (اختياري)
//   Future<void> deleteFromFirestore() async {
//     await FirebaseFirestore.instance.collection('users').doc(model.uid).delete();
//   }
// }
