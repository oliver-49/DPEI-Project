import 'package:equatable/equatable.dart';

abstract class AccountDetailsState extends Equatable {
  final String ownerName;
  final String nicNumber;
  final String phoneNumber;
  final String nicExpiryDate;
  final bool isFormValid;

  const AccountDetailsState({
    this.ownerName = '',
    this.nicNumber = '',
    this.phoneNumber = '',
    this.nicExpiryDate = '',
    this.isFormValid = false,
  });

  @override
  List<Object> get props => [
    ownerName,
    nicNumber,
    phoneNumber,
    nicExpiryDate,
    isFormValid,
  ];
}

class AccountDetailsInitial extends AccountDetailsState {
  const AccountDetailsInitial();
}

class AccountDetailsUpdated extends AccountDetailsState {
  const AccountDetailsUpdated({
    required super.ownerName,
    required super.nicNumber,
    required super.phoneNumber,
    required super.nicExpiryDate,
    required super.isFormValid,
  });
}

class AccountDetailsError extends AccountDetailsState {
  final String error;

  const AccountDetailsError({
    required this.error,
    required super.ownerName,
    required super.nicNumber,
    required super.phoneNumber,
    required super.nicExpiryDate,
    required super.isFormValid,
  });

  @override
  List<Object> get props => [...super.props, error];
}
