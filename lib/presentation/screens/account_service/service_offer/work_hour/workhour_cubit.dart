import 'package:dpei_project/presentation/screens/account_service/service_offer/work_hour/workHour_state.dart';
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
    // هنا ممكن تستخدم SharedPreferences أو Hive لتخزين fromTime و toTime
  }

  void submitToFirebase() {
    if (state.fromTime == null || state.toTime == null) {
      emit(state.copyWith(errorMessage: 'يرجى ملء كل الحقول'));
      return;
    }

    emit(state.copyWith(isLoading: true));

    // هنا ممكن تضيف الكود لرفع البيانات على Firebase
    Future.delayed(const Duration(seconds: 1), () {
      emit(state.copyWith(isLoading: false));
    });
  }
}
