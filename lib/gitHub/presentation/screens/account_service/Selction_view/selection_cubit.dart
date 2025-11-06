import 'package:flutter_bloc/flutter_bloc.dart';

class SelectionState {
  final String? selectedRole;
  final bool navigateNext;
  final String? errorMessage;

  SelectionState({
    this.selectedRole,
    this.navigateNext = false,
    this.errorMessage,
  });

  SelectionState copyWith({
    String? selectedRole,
    bool? navigateNext,
    String? errorMessage,
  }) {
    return SelectionState(
      selectedRole: selectedRole ?? this.selectedRole,
      navigateNext: navigateNext ?? this.navigateNext,
      errorMessage: errorMessage,
    );
  }
}

class SelectionCubit extends Cubit<SelectionState> {
  SelectionCubit() : super(SelectionState());

  void selectOption(String role) {
    emit(state.copyWith(selectedRole: role, errorMessage: null));
  }

  void onNextTapped() {
    if (state.selectedRole != null) {
      emit(state.copyWith(navigateNext: true, errorMessage: null));
    } else {
      emit(state.copyWith(errorMessage: 'من فضلك اختار دورك'));
    }
  }

  void resetNavigation() {
    emit(state.copyWith(navigateNext: false));
  }
}
