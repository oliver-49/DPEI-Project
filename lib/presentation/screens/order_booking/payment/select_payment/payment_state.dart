import 'package:equatable/equatable.dart';

class PaymentState extends Equatable {
  final int selectedMethodIndex;

  final int selectedCardIndex;

  final List<Map<String, dynamic>> savedCards;

  const PaymentState({
    this.selectedMethodIndex = -1,
    this.selectedCardIndex = -1,
    this.savedCards = const [],
  });

  PaymentState copyWith({
    int? selectedMethodIndex,
    int? selectedCardIndex,
    List<Map<String, dynamic>>? savedCards,
  }) {
    return PaymentState(
      selectedMethodIndex: selectedMethodIndex ?? this.selectedMethodIndex,
      selectedCardIndex: selectedCardIndex ?? this.selectedCardIndex,
      savedCards: savedCards ?? this.savedCards,
    );
  }

  @override
  List<Object?> get props => [
    selectedMethodIndex,
    selectedCardIndex,
    savedCards,
  ];
}
