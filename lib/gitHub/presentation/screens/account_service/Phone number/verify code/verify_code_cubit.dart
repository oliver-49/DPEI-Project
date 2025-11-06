import 'dart:async';
import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyCodeState {
  final List<String> digits;
  final bool isSuccess;
  final String? errorMessage;
  final bool isLoading;
  final int resendCountdown;
  VerifyCodeState({
    required this.digits,
    this.isSuccess = false,
    this.errorMessage,
    this.isLoading = false,
    this.resendCountdown = 60,
  });

  VerifyCodeState copyWith({
    List<String>? digits,
    bool? isSuccess,
    String? errorMessage,
    bool? isLoading,
    int? resendCountdown,
  }) {
    return VerifyCodeState(
      digits: digits ?? this.digits,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
      isLoading: isLoading ?? this.isLoading,
      resendCountdown: resendCountdown ?? this.resendCountdown,
    );
  }
}

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  Timer? _timer;

  VerifyCodeCubit() : super(VerifyCodeState(digits: List.filled(5, ""))) {
    startCountdown();
  }

  void updateDigit(int index, String value) {
    final newDigits = List<String>.from(state.digits);
    newDigits[index] = value;
    emit(
      state.copyWith(digits: newDigits, errorMessage: null, isSuccess: false),
    );
  }

  void verifyCode({
    required VoidCallback onSuccess,
    required VoidCallback onError,
    required Function(String) showError,
  }) {
    final code = state.digits.join();
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));

    Future.delayed(const Duration(seconds: 1), () {
      if (code == "12345") {
        emit(state.copyWith(isSuccess: true, isLoading: false));
        onSuccess();
      } else {
        emit(
          state.copyWith(
            errorMessage: "الكود غلط! حاول تاني",
            isLoading: false,
          ),
        );
        showError("الكود غلط! حاول تاني");
        onError();
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
