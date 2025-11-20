import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceProviderModel {
  final String uid;
  String name;
  String email;
  String phone;
  String ownerName;
  String nicNumber;
  String businessName;
  String businessAddress;
  String service;
  String serviceArea;
  String experienceYear;
  String startingTime;
  String endingTime;
  bool allSetup;
  DateTime? createdAt;
  String role;

  ServiceProviderModel({
    required this.uid,
    this.name = '',
    this.email = '',
    this.phone = '',
    this.ownerName = '',
    this.nicNumber = '',
    this.businessName = '',
    this.businessAddress = '',
    this.service = '',
    this.serviceArea = '',
    this.experienceYear = '',
    this.startingTime = '',
    this.endingTime = '',
    this.allSetup = false,
    this.createdAt,
    this.role = '',
  });

  factory ServiceProviderModel.fromMap(Map<String, dynamic> map, {String? uid}) {
    return ServiceProviderModel(
      uid: uid ?? (map['uid'] as String? ?? ''),
      name: map['name'] as String? ?? '',
      email: map['email'] as String? ?? '',
      phone: map['phone'] as String? ?? '',
      ownerName: map['ownerName'] as String? ?? '',
      nicNumber: map['nicNumber'] as String? ?? '',
      businessName: map['business name'] as String? ?? map['businessName'] as String? ?? '',
      businessAddress: map['business address'] as String? ?? '',
      service: map['Service'] as String? ?? map['service'] as String? ?? '',
      serviceArea: map['Service Area'] as String? ?? map['serviceArea'] as String? ?? '',
      experienceYear: map['Experience Year'] as String? ?? '',
      startingTime: map['Starting Time'] as String? ?? '',
      endingTime: map['Ending Time'] as String? ?? '',
      allSetup: map['allsetup'] as bool? ?? false,
      createdAt: map['createdAt'] is Timestamp
          ? (map['createdAt'] as Timestamp).toDate()
          : (map['createdAt'] is String ? DateTime.tryParse(map['createdAt']) : null),
      role: map['role'] as String? ?? 'provider',
    );
  }

  Map<String, dynamic> toMapForFirestore() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'ownerName': ownerName,
      'nicNumber': nicNumber,
      'business name': businessName,
      'business address': businessAddress,
      'Service': service,
      'Service Area': serviceArea,
      'Experience Year': experienceYear,
      'Starting Time': startingTime,
      'Ending Time': endingTime,
      'allsetup': allSetup,
      'createdAt': createdAt == null ? FieldValue.serverTimestamp() : Timestamp.fromDate(createdAt!),
      'role': role,
    };
  }

  // نسخة تساعد لو عايز تستخدم Realtime DB (تحتوي DateTime كـ ISO string)
  Map<String, dynamic> toMapForRealtime() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'ownerName': ownerName,
      'nicNumber': nicNumber,
      'business name': businessName,
      'business address': businessAddress,
      'Service': service,
      'Service Area': serviceArea,
      'Experience Year': experienceYear,
      'Starting Time': startingTime,
      'Ending Time': endingTime,
      'allsetup': allSetup,
      'createdAt': createdAt?.toIso8601String() ?? DateTime.now().toIso8601String(),
      'role': role,
    };
  }


@override
String toString() {
  return '''
UID: $uid
Name: $name
Email: $email
Phone: $phone
Owner Name: $ownerName
NIC Number: $nicNumber
Business Name: $businessName
Business Address: $businessAddress
Service: $service
Service Area: $serviceArea
Experience Year: $experienceYear
Starting Time: $startingTime
Ending Time: $endingTime
All Setup: $allSetup
Created At: $createdAt
Role: $role
''';
}


}
