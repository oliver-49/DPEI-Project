import 'package:fixit/core/stores/app_box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(const PaymentState());

  void loadSavedCards({bool selectLast = false}) {
    final cards = AppBox.cardsBox.values
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();

    int savedMethod = AppBox.getSelectedPaymentMethod();
    int savedCard = AppBox.getSelectedCard();

    int methodIndex = savedMethod;
    int cardIndex = savedCard;

    if (selectLast && cards.isNotEmpty) {
      cardIndex = cards.length - 1;
      methodIndex = -1;

      AppBox.setSelectedCard(cardIndex);
    }

    emit(
      state.copyWith(
        savedCards: cards,
        selectedCardIndex: cardIndex,
        selectedMethodIndex: methodIndex,
      ),
    );
  }

  void selectMethod(int index) {
    AppBox.setSelectedPaymentMethod(index);
    AppBox.setSelectedCard(-1);

    emit(state.copyWith(selectedMethodIndex: index, selectedCardIndex: -1));
  }

  void selectCard(int index) {
    AppBox.setSelectedPaymentMethod(-1);
    AppBox.setSelectedCard(index);

    emit(state.copyWith(selectedCardIndex: index, selectedMethodIndex: -1));
  }
}
