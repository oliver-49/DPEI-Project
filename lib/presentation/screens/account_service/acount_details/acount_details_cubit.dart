import 'package:bloc/bloc.dart';
// تأكدي من المسار الصحيح للحالة
import 'package:dpei_project/presentation/screens/account_service/acount_details/acount_details_state.dart';

class AccountDetailsCubit extends Cubit<AccountDetailsState> {
  AccountDetailsCubit() : super(const AccountDetailsInitial());

  // دالة تحديث عامة تقبل قيم اختيارية
  void updateField({
    String? ownerName,
    String? nicNumber,
    String? phoneNumber,
    String? nicExpiryDate,
  }) {
    // بناء حالة مؤقتة جديدة بالبيانات المحدثة أو القديمة
    final updatedOwnerName = ownerName ?? state.ownerName;
    final updatedNicNumber = nicNumber ?? state.nicNumber;
    final updatedPhoneNumber = phoneNumber ?? state.phoneNumber;
    final updatedNicExpiryDate = nicExpiryDate ?? state.nicExpiryDate;

    // منطق التحقق من صحة النموذج (بسيط: يجب أن تكون جميع الحقول ممتلئة)
    final bool isFormValid =
        updatedOwnerName.isNotEmpty &&
        updatedNicNumber.isNotEmpty &&
        updatedPhoneNumber.isNotEmpty &&
        updatedNicExpiryDate.isNotEmpty;

    // إصدار الحالة الجديدة
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
      // هنا يمكنك تنفيذ منطق حفظ البيانات أو التنقل

      // مثال: التنقل إلى الشاشة التالية (يجب إصدار حالة Success هنا)
      // emit(AccountDetailsSuccess(
      //     ownerName: state.ownerName,
      //     // ... باقي البيانات
      // ));
    } else {
      // إصدار حالة خطأ لعرض SnackBar أو رسالة تحذير
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
