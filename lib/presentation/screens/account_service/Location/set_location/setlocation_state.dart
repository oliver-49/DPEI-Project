class SetLocationState {
  final String businessName;
  final String businessAddress;
  final String location;
  final bool isLoading;
  final String? errorMessage;

  SetLocationState({
    this.businessName = '',
    this.businessAddress = '',
    this.location = '',
    this.isLoading = false,
    this.errorMessage,
  });

  SetLocationState copyWith({
    String? businessName,
    String? businessAddress,
    String? location,
    bool? isLoading,
    String? errorMessage,
  }) {
    return SetLocationState(
      businessName: businessName ?? this.businessName,
      businessAddress: businessAddress ?? this.businessAddress,
      location: location ?? this.location,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}
