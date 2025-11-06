
import 'package:flutter_bloc/flutter_bloc.dart';
import 'passowrd_state.dart';

class CreatePasswordCubit extends Cubit<CreatePasswordState> {
  CreatePasswordCubit() : super(CreatePasswordInitial());

  void savePassword(String pass1, String pass2) async {
    if (pass1.isEmpty || pass2.isEmpty) {
      emit(CreatePasswordError("Please fill all fields"));
      return;
    } else if (pass1.length < 6) {
      emit(CreatePasswordError("Password must be at least 6 characters"));
      return;
    }
    else if (pass1 != pass2) {
      emit(CreatePasswordError("Passwords do not match"));
      return;
    }

    emit(CreatePasswordLoading());
    await Future.delayed(const Duration(seconds: 2));

    emit(CreatePasswordSuccess());
  }
}
