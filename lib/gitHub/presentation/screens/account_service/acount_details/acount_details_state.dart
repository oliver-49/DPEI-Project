import 'package:equatable/equatable.dart';

abstract class AccountDetailsState extends Equatable {
  final String ownerName;
  final String nicNumber; // 14 digits
  // final String phoneNumber; // 11 digits with 010/011/012/015
  final DateTime? nicExpiryDate; // picked via DatePicker
  final bool isFormValid;
  final String? error; // optional error for SnackBar

  const AccountDetailsState({
    this.ownerName = '',
    this.nicNumber = '',
    // this.phoneNumber = '',
    this.nicExpiryDate,
    this.isFormValid = false,
    this.error,
  });

  @override
  List<Object?> get props => [
    ownerName,
    nicNumber,
    // phoneNumber,
    nicExpiryDate,
    isFormValid,
    error,
  ];
}

class AccountDetailsInitial extends AccountDetailsState {
  const AccountDetailsInitial() : super();
}

class AccountDetailsUpdated extends AccountDetailsState {
  const AccountDetailsUpdated({
    required super.ownerName,
    required super.nicNumber,
    // required super.phoneNumber,
    required super.nicExpiryDate,
    required super.isFormValid,
    super.error,
  });
}

class AccountDetailsError extends AccountDetailsState {
  const AccountDetailsError({
    required String super.error,
    required super.ownerName,
    required super.nicNumber,
    // required super.phoneNumber,
    required super.nicExpiryDate,
    required super.isFormValid,
  });
}
