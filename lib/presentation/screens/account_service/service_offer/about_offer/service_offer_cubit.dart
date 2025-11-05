import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fixit/core/stores/app_box.dart';
import 'service_offer_state.dart';

class ServiceOfferCubit extends Cubit<ServiceOfferState> {
  ServiceOfferCubit() : super(const ServiceOfferState());

  void selectService(String value) {
    emit(state.copyWith(selectedService: value, errorMessage: null));

    AppBox.box.put('selected_service', value);
  }

  void selectExperience(String value) {
    emit(state.copyWith(selectedExperience: value, errorMessage: null));

    AppBox.box.put('selected_experience', value);
  }

  void selectArea(String value) {
    emit(state.copyWith(selectedArea: value, errorMessage: null));

    AppBox.box.put('selected_area', value);
  }

  void saveDataLocally() async {
    if (state.selectedService != null) {
      await AppBox.box.put('selected_service', state.selectedService);
    }
    if (state.selectedExperience != null) {
      await AppBox.box.put('selected_experience', state.selectedExperience);
    }
    if (state.selectedArea != null) {
      await AppBox.box.put('selected_area', state.selectedArea);
    }
  }

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
