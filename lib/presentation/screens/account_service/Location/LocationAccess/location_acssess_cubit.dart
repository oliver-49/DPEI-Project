import 'package:flutter_bloc/flutter_bloc.dart';

class LocationAccessState {
  final String selectedOption;

  LocationAccessState({this.selectedOption = ''});

  LocationAccessState copyWith({String? selectedOption}) {
    return LocationAccessState(
      selectedOption: selectedOption ?? this.selectedOption,
    );
  }
}

class LocationAccessCubit extends Cubit<LocationAccessState> {
  LocationAccessCubit() : super(LocationAccessState());

  void selectOption(String option) {
    emit(state.copyWith(selectedOption: option));
  }
}
