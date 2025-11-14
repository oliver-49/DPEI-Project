import 'package:flutter_bloc/flutter_bloc.dart';
import 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit() : super(VerificationInitial());

  String? selectedMethod;
  void selectMethod(String method) {
    selectedMethod = method;
    emit(VerificationSelected(method));
  }

  void goNext() {
    if (selectedMethod == null) {
      emit(VerificationError("Please select a verification method first"));
    } else {
      emit(VerificationNext(selectedMethod!));
    }
  }
}
