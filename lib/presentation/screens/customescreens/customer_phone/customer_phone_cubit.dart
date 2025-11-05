import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fixit/core/stores/app_box.dart';

class CustomerPhoneState {
  final Color borderColor;
  final String countryCode;
  final String phone;

  CustomerPhoneState({
    this.borderColor = const Color(0xffCACACA),
    this.countryCode = '+20',
    this.phone = '',
  });

  CustomerPhoneState copyWith({
    Color? borderColor,
    String? countryCode,
    String? phone,
  }) {
    return CustomerPhoneState(
      borderColor: borderColor ?? this.borderColor,
      countryCode: countryCode ?? this.countryCode,
      phone: phone ?? this.phone,
    );
  }
}

class CustomerPhoneCubit extends Cubit<CustomerPhoneState> {
  CustomerPhoneCubit() : super(CustomerPhoneState());

  String? validatePhone() {
    final p = state.phone.trim();

    if (p.isEmpty) return 'من فضلك أدخل رقم الهاتف';
    if (p.length != 11) return 'رقم الهاتف يجب أن يكون 11 رقمًا';

    const allowedPrefixes = ['010', '011', '012', '015'];
    final hasValidPrefix = allowedPrefixes.any((pre) => p.startsWith(pre));
    if (!hasValidPrefix) {
      return 'رقم المحمول يجب أن يبدأ بـ 010 أو 011 أو 012 أو 015';
    }

    final isAllDigits = RegExp(r'^\d{11}$').hasMatch(p);
    if (!isAllDigits) return 'رقم الهاتف يجب أن يحتوي على أرقام فقط';

    return null;
  }

  void changeBorder(Color color) => emit(state.copyWith(borderColor: color));

  void setCountryCode(String code) => emit(state.copyWith(countryCode: code));

  void setPhone(String phone) {
    emit(state.copyWith(phone: phone));

    final fullPhone = '${state.countryCode}$phone';
    AppBox.box.put('customer_phone', fullPhone);
  }

  Future<void> savePhoneToHive() async {
    final fullPhone = '${state.countryCode}${state.phone}';
    await AppBox.box.put('customer_phone', fullPhone);
  }
}
