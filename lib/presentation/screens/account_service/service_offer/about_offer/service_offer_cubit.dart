import 'package:flutter_bloc/flutter_bloc.dart';
import 'service_offer_state.dart';

class ServiceOfferCubit extends Cubit<ServiceOfferState> {
  ServiceOfferCubit() : super(ServiceOfferState());

  void selectService(String value) {
    emit(state.copyWith(selectedService: value, errorMessage: null));
  }

  void selectExperience(String value) {
    emit(state.copyWith(selectedExperience: value, errorMessage: null));
  }

  void selectArea(String value) {
    emit(state.copyWith(selectedArea: value, errorMessage: null));
  }

  void saveDataLocally() {
    // هنا ممكن تضيف الكود لتخزين البيانات على SharedPreferences أو Hive
  }

  void submitToFirebase() {
    if (state.selectedService == null ||
        state.selectedExperience == null ||
        state.selectedArea == null) {
      emit(state.copyWith(errorMessage: 'Please fill all fields'));
      return;
    }

    emit(state.copyWith(isLoading: true));

    // هنا ممكن تضيف الكود لرفع البيانات على Firebase
    Future.delayed(const Duration(seconds: 1), () {
      emit(state.copyWith(isLoading: false));
    });
  }
}
