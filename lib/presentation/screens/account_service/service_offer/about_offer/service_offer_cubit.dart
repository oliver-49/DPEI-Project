import 'package:flutter_bloc/flutter_bloc.dart';
import 'service_offer_state.dart';

class ServiceOfferCubit extends Cubit<ServiceOfferState> {
  ServiceOfferCubit() : super(const ServiceOfferState());

  void selectService(String value) {
    emit(state.copyWith(selectedService: value, errorMessage: null));
  }

  void selectExperience(String value) {
    emit(state.copyWith(selectedExperience: value, errorMessage: null));
  }

  void selectArea(String value) {
    emit(state.copyWith(selectedArea: value, errorMessage: null));
  }

  void saveDataLocally() {}

  Future<bool> submitToFirebase() async {
    if (state.selectedService == null ||
        state.selectedExperience == null ||
        state.selectedArea == null) {
      emit(state.copyWith(errorMessage: 'من فضلك املأ كل الحقول'));
      return false;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(isLoading: false));
      return true;
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'حدث خطأ غير متوقع. حاول مرة أخرى.',
        ),
      );
      return false;
    }
  }
}
