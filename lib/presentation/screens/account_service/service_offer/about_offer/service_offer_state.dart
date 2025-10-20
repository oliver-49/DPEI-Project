class ServiceOfferState {
  final String? selectedService;
  final String? selectedExperience;
  final String? selectedArea;
  final bool isLoading;
  final String? errorMessage;

  ServiceOfferState({
    this.selectedService,
    this.selectedExperience,
    this.selectedArea,
    this.isLoading = false,
    this.errorMessage,
  });

  ServiceOfferState copyWith({
    String? selectedService,
    String? selectedExperience,
    String? selectedArea,
    bool? isLoading,
    String? errorMessage,
  }) {
    return ServiceOfferState(
      selectedService: selectedService ?? this.selectedService,
      selectedExperience: selectedExperience ?? this.selectedExperience,
      selectedArea: selectedArea ?? this.selectedArea,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}
