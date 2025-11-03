import 'package:flutter_bloc/flutter_bloc.dart';
import 'code_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit() : super(VerifyInitial());

  void verifyCode(String code) async {
    if (code.length != 5) {
      emit(VerifyError("Please enter the 5-digit code."));
    } else {
      emit(VerifyLoading());
      await Future.delayed(const Duration(seconds: 2));
      if (code == "12345") {
        emit(VerifySuccess());
      } else {
        emit(VerifyError("Invalid code. Please try again."));
      }
    }
  }
}
