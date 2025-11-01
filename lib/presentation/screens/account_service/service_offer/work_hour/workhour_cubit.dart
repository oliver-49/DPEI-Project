
import 'package:fixit/presentation/screens/account_service/service_offer/work_hour/workhour_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkhourCubit extends Cubit<WorkhourState> {
  WorkhourCubit() : super(WorkhourState());

  void setFromTime(String value) {
    emit(state.copyWith(fromTime: value, errorMessage: null));
  }

  void setToTime(String value) {
    emit(state.copyWith(toTime: value, errorMessage: null));
  }

  void saveDataLocally() {
    
  }

  void submitToFirebase() {
    if (state.fromTime == null || state.toTime == null) {
      emit(state.copyWith(errorMessage: 'يرجى ملء كل الحقول'));
      return;
    }

    emit(state.copyWith(isLoading: true));

    Future.delayed(const Duration(seconds: 1), () {
      emit(state.copyWith(isLoading: false));
    });
  }
}
