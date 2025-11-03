import 'package:flutter_bloc/flutter_bloc.dart';
import 'email_state.dart';

class EmailCubit extends Cubit<EmailState> {
  EmailCubit() : super(EmailInitial());

  void sendCode(String email) async {
    emit(EmailLoading());
    await Future.delayed(Duration(seconds: 2));
    emit(EmailSuccess());
  }
}

