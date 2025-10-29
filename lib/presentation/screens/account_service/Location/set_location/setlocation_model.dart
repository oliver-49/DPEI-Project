class SetLocationModel {
  final String businessName;
  final String businessAddress;
  final String location;

  SetLocationModel({
    required this.businessName,
    required this.businessAddress,
    required this.location,
  });

  SetLocationModel copyWith({
    String? businessName,
    String? businessAddress,
    String? location,
  }) {
    return SetLocationModel(
      businessName: businessName ?? this.businessName,
      businessAddress: businessAddress ?? this.businessAddress,
      location: location ?? this.location,
    );
  }
}
