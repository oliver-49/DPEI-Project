import 'package:bloc/bloc.dart';
import 'acount_details_state.dart';

class AccountDetailsCubit extends Cubit<AccountDetailsState> {
  AccountDetailsCubit() : super(const AccountDetailsInitial());

  bool _isValidNic(String v) => RegExp(r'^\d{14}$').hasMatch(v);
  // bool _isValidPhone(String v) =>
  //     RegExp(r'^(010|011|012|015)\d{8}$').hasMatch(v);

  void updateField({
    String? ownerName,
    String? nicNumber,
    // String? phoneNumber,
    DateTime? nicExpiryDate,
  }) {
    final updatedOwnerName = ownerName ?? state.ownerName;
    final updatedNicNumber = nicNumber ?? state.nicNumber;
    // final updatedPhoneNumber = phoneNumber ?? state.phoneNumber;
    final updatedExpiry = nicExpiryDate ?? state.nicExpiryDate;

    final isFormValid =
        updatedOwnerName.trim().isNotEmpty &&
        _isValidNic(updatedNicNumber) &&
        // _isValidPhone(updatedPhoneNumber) &&
        updatedExpiry != null;

    emit(
      AccountDetailsUpdated(
        ownerName: updatedOwnerName,
        nicNumber: updatedNicNumber,
        // phoneNumber: updatedPhoneNumber,
        nicExpiryDate: updatedExpiry,
        isFormValid: isFormValid,
        error: null,
      ),
    );
  }

  void submitDetails() {
    if (state.isFormValid) {
      emit(
        AccountDetailsUpdated(
          ownerName: state.ownerName,
          nicNumber: state.nicNumber,
          // phoneNumber: state.phoneNumber,
          nicExpiryDate: state.nicExpiryDate,
          isFormValid: true,
          error: null,
        ),
      );
    } else {
      emit(
        AccountDetailsError(
          error:
              "الرجاء التأكد من صحة البيانات: الرقم القومي 14 رقم، "
            ,  // "الهاتف 11 رقم ويبدأ بـ 010 أو 011 أو 012 أو 015، وتحديد تاريخ الانتهاء.",
          ownerName: state.ownerName,
          nicNumber: state.nicNumber,
          // phoneNumber: state.phoneNumber,
          nicExpiryDate: state.nicExpiryDate,
          isFormValid: false,
        ),
      );
    }
  }
}
