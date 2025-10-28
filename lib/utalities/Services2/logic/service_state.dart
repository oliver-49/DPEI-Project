import 'package:dpei_project/utalities/Services/services_model.dart';

abstract class ServiceState {}

class ServiceInitial extends ServiceState {}

class ServiceLoadingState extends ServiceState {}

class ServiceSuccessState extends ServiceState {
  final List<ServicesModel> services;
  ServiceSuccessState({required this.services}) {}
}

class ServicefalierState extends ServiceState {
  final String errorMessege;
  ServicefalierState({required this.errorMessege}) {}
}
