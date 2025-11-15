class AddNewCardState {
  final String? selectedCardType;
  final String cardNumber;
  final String holderName;
  final String expiryDate;
  final String cvv;

  AddNewCardState({
    this.selectedCardType,
    this.cardNumber = "",
    this.holderName = "",
    this.expiryDate = "",
    this.cvv = "",
  });

  AddNewCardState copyWith({
    String? selectedCardType,
    String? cardNumber,
    String? holderName,
    String? expiryDate,
    String? cvv,
  }) {
    return AddNewCardState(
      selectedCardType: selectedCardType ?? this.selectedCardType,
      cardNumber: cardNumber ?? this.cardNumber,
      holderName: holderName ?? this.holderName,
      expiryDate: expiryDate ?? this.expiryDate,
      cvv: cvv ?? this.cvv,
    );
  }
}
