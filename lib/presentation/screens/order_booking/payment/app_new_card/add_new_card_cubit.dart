import 'package:fixit/presentation/screens/order_booking/models/saved_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fixit/core/stores/app_box.dart';
import 'add_new_card_state.dart';

class AddNewCardCubit extends Cubit<AddNewCardState> {
  AddNewCardCubit() : super(AddNewCardState());

  void changeCardType(String value) {
    emit(state.copyWith(selectedCardType: value));
  }

  void setCardNumber(String value) {
    emit(state.copyWith(cardNumber: value));
  }

  void setHolderName(String value) {
    emit(state.copyWith(holderName: value));
  }

  void setExpiryDate(String value) {
    emit(state.copyWith(expiryDate: value));
  }

  void setCvv(String value) {
    emit(state.copyWith(cvv: value));
  }

  Future<bool> saveCard() async {
    if (state.selectedCardType == null) return false;
    if (state.cardNumber.length < 16) return false;
    if (state.holderName.isEmpty) return false;
    if (state.expiryDate.isEmpty) return false;

    final last4 = state.cardNumber.substring(state.cardNumber.length - 4);

    final card = SavedCard(
      cardType: state.selectedCardType!,
      last4: last4,
      holderName: state.holderName,
      expiry: state.expiryDate,
    );

    await AppBox.addNewCard(card as Map<String, dynamic>);
    return true;
  }
}
