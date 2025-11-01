import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class PhoneNumberState {
  final Color borderColor;
  final String countryCode;
  final String phone;

  PhoneNumberState({
    this.borderColor = const Color(0xffCACACA),
    this.countryCode = '+20',
    this.phone = '',
  });

  PhoneNumberState copyWith({
    Color? borderColor,
    String? countryCode,
    String? phone,
  }) {
    return PhoneNumberState(
      borderColor: borderColor ?? this.borderColor,
      countryCode: countryCode ?? this.countryCode,
      phone: phone ?? this.phone,
    );
  }
}

class PhoneNumberCubit extends Cubit<PhoneNumberState> {
  PhoneNumberCubit() : super(PhoneNumberState());

  String? validatePhone() {
    if (state.phone.length != 11) {
      return 'رقم التليفون غير صحيح. يجب أن يكون 11 رقم على الأقل';
    }
    return null;
  }

  void changeBorder(Color color) => emit(state.copyWith(borderColor: color));
  void setCountryCode(String code) => emit(state.copyWith(countryCode: code));
  void setPhone(String phone) => emit(state.copyWith(phone: phone));
}
