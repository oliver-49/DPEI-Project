import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fixit/core/stores/app_box.dart'; // ✅ استيراد Hive
import 'setlocation_state.dart';

class SetLocationCubit extends Cubit<SetLocationState> {
  SetLocationCubit() : super(SetLocationState());

  void updateBusinessName(String name) {
    emit(state.copyWith(businessName: name, errorMessage: null));

    AppBox.box.put('business_name', name);
  }

  void updateBusinessAddress(String address) {
    emit(state.copyWith(businessAddress: address, errorMessage: null));

    AppBox.box.put('business_address', address);
  }

  void updateLocation(String location) {
    emit(state.copyWith(location: location, errorMessage: null));

    AppBox.box.put('location', location);
  }

  void showError(String message) {
    emit(state.copyWith(errorMessage: message));
  }

  void saveData() async {
    if (state.businessName.isEmpty || state.businessAddress.isEmpty) {
      emit(state.copyWith(errorMessage: 'من فضلك ادخل كل البيانات'));
      return;
    }

    emit(state.copyWith(isLoading: true));

    await AppBox.box.put('business_name', state.businessName);
    await AppBox.box.put('business_address', state.businessAddress);
    await AppBox.box.put('location', state.location);

    await AppBox.setSetupDone(true);

    Future.delayed(const Duration(seconds: 1), () {
      emit(state.copyWith(isLoading: false));
    });
  }
}
