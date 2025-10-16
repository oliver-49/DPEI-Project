import 'package:flutter_bloc/flutter_bloc.dart';

sealed class SelectionState {}

class InitialSelection extends SelectionState {}

class OptionSelected extends SelectionState {
  final String selectedOption;
  OptionSelected(this.selectedOption);
}

class NavigationRequested extends SelectionState {
  final String destination;
  NavigationRequested(this.destination);
}

class SelectionCubit extends Cubit<SelectionState> {
  SelectionCubit() : super(InitialSelection());

  void selectOption(String option) {
    emit(OptionSelected(option));
  }

  void onNextTapped() {
    if (state is OptionSelected) {
      final selectedOption = (state as OptionSelected).selectedOption;

      if (selectedOption == 'Service Provider') {
        emit(NavigationRequested('service_provider'));
      } else if (selectedOption == 'Looking for service') {
        emit(NavigationRequested('customer'));
      }
    } else {
      emit(InitialSelection());
    }
  }
}
