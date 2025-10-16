import 'package:flutter_bloc/flutter_bloc.dart';

class LocationAccessState {
  final String selectedOption;
  final String? errorMessage;

  LocationAccessState({this.selectedOption = '', this.errorMessage});

  LocationAccessState copyWith({String? selectedOption, String? errorMessage}) {
    return LocationAccessState(
      selectedOption: selectedOption ?? this.selectedOption,
      errorMessage: errorMessage,
    );
  }
}

class LocationAccessCubit extends Cubit<LocationAccessState> {
  LocationAccessCubit() : super(LocationAccessState());

  void selectOption(String option) {
    emit(state.copyWith(selectedOption: option, errorMessage: null));
  }

  void showError(String message) {
    emit(state.copyWith(errorMessage: message));
  }
}
