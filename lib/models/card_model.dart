// This model class represents a Credit Card object.
// It will hold all the data related to a user's credit card.

class CardModel {
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final String cvv;

  // Constructor
  CardModel({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cvv,
  });
}