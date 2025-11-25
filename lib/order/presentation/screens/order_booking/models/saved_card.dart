class SavedCard {
  final String cardType;
  final String last4;
  final String holderName;
  final String expiry;

  SavedCard({
    required this.cardType,
    required this.last4,
    required this.holderName,
    required this.expiry,
  });

  Map<String, dynamic> toMap() {
    return {
      "cardType": cardType,
      "last4": last4,
      "holderName": holderName,
      "expiry": expiry,
    };
  }

  factory SavedCard.fromMap(Map map) {
    return SavedCard(
      cardType: map["cardType"],
      last4: map["last4"],
      holderName: map["holderName"],
      expiry: map["expiry"],
    );
  }
}
