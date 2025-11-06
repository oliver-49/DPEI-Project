import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerVerifyCodeState {
  final List<String> digits;
  final bool isSuccess;
  final String? errorMessage;
  final bool isLoading;
  final int resendCountdown;

  CustomerVerifyCodeState({
    required this.digits,
    this.isSuccess = false,
    this.errorMessage,
    this.isLoading = false,
    this.resendCountdown = 60,
  });

  CustomerVerifyCodeState copyWith({
    List<String>? digits,
    bool? isSuccess,
    String? errorMessage,
    bool? isLoading,
    int? resendCountdown,
  }) {
    return CustomerVerifyCodeState(
      digits: digits ?? this.digits,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
      isLoading: isLoading ?? this.isLoading,
      resendCountdown: resendCountdown ?? this.resendCountdown,
    );
  }
}

class CustomerVerifyCodeCubit extends Cubit<CustomerVerifyCodeState> {
  Timer? _timer;

  CustomerVerifyCodeCubit()
    : super(CustomerVerifyCodeState(digits: List.filled(5, ""))) {
    startCountdown();
  }

  void updateDigit(int index, String value) {
    final newDigits = List<String>.from(state.digits);
    newDigits[index] = value;
    emit(
      state.copyWith(digits: newDigits, errorMessage: null, isSuccess: false),
    );
  }

  void verifyCode() {
    final code = state.digits.join();
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));

    Future.delayed(const Duration(seconds: 1), () {
      if (code == "12345") {
        emit(state.copyWith(isSuccess: true, isLoading: false));
      } else {
        emit(
          state.copyWith(
            errorMessage: "الكود غير صحيح، حاول مرة أخرى.",
            isLoading: false,
          ),
        );
      }
    });
  }

  void startCountdown() {
    _timer?.cancel();
    emit(state.copyWith(resendCountdown: 60));
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.resendCountdown > 0) {
        emit(state.copyWith(resendCountdown: state.resendCountdown - 1));
      } else {
        timer.cancel();
      }
    });
  }

  void resendCode() {
    startCountdown();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
