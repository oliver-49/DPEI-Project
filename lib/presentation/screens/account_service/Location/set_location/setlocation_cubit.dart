import 'package:flutter_bloc/flutter_bloc.dart';
import 'setlocation_state.dart';

class SetLocationCubit extends Cubit<SetLocationState> {
  SetLocationCubit() : super(SetLocationState());

  void updateBusinessName(String name) {
    emit(state.copyWith(businessName: name, errorMessage: null));
  }

  void updateBusinessAddress(String address) {
    emit(state.copyWith(businessAddress: address, errorMessage: null));
  }

  void updateLocation(String location) {
    emit(state.copyWith(location: location, errorMessage: null));
  }

  void showError(String message) {
    emit(state.copyWith(errorMessage: message));
  }

  void saveData() {
    if (state.businessName.isEmpty || state.businessAddress.isEmpty) {
      emit(state.copyWith(errorMessage: 'من فضلك ادخل كل البيانات'));
      return;
    }
    emit(state.copyWith(isLoading: true));
    // هنا ممكن بعدين نحط save في local storage أو API
    Future.delayed(const Duration(seconds: 1), () {
      emit(state.copyWith(isLoading: false));
    });
  }
}
