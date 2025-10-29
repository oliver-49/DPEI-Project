import 'package:bloc/bloc.dart';
import 'package:dpei_project/presentation/screens/account_service/acount_details/acount_details_state.dart';

class AccountDetailsCubit extends Cubit<AccountDetailsState> {
  AccountDetailsCubit() : super(const AccountDetailsInitial());

  void updateField({
    String? ownerName,
    String? nicNumber,
    String? phoneNumber,
    String? nicExpiryDate,
  }) {
    final updatedOwnerName = ownerName ?? state.ownerName;
    final updatedNicNumber = nicNumber ?? state.nicNumber;
    final updatedPhoneNumber = phoneNumber ?? state.phoneNumber;
    final updatedNicExpiryDate = nicExpiryDate ?? state.nicExpiryDate;

    final bool isFormValid =
        updatedOwnerName.isNotEmpty &&
        updatedNicNumber.isNotEmpty &&
        updatedPhoneNumber.isNotEmpty &&
        updatedNicExpiryDate.isNotEmpty;

    emit(
      AccountDetailsUpdated(
        ownerName: updatedOwnerName,
        nicNumber: updatedNicNumber,
        phoneNumber: updatedPhoneNumber,
        nicExpiryDate: updatedNicExpiryDate,
        isFormValid: isFormValid,
      ),
    );
  }

  void submitDetails() {
    if (state.isFormValid) {
    } else {
      emit(
        AccountDetailsError(
          error: "الرجاء ملء جميع الحقول المطلوبة.",
          ownerName: state.ownerName,
          nicNumber: state.nicNumber,
          phoneNumber: state.phoneNumber,
          nicExpiryDate: state.nicExpiryDate,
          isFormValid: false,
        ),
      );
    }
  }
}
