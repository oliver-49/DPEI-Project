import 'package:fixit/booking_services/cubit/booking_state.dart';
import 'package:fixit/booking_services/model/Address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());

  // change favorit icon*******************************
  bool favorit = true;
  void toggleFavorit() {
    favorit = !favorit;
    emit(FavoritChange(favorit));
  }

  // setAddress**************************************
  void addressChange(AddressModel adressmodel) {
    try {
      if (adressmodel.homeNo.length > 5 &&
          adressmodel.streetNo.length > 5 &&
          adressmodel.fullAddress.length > 5) {
        emit(AddressSucsuessState());
      } else {
        emit(AddressErrorState());
      }
    } catch (e) {
      emit(AddressErrorState());
    }
  }

  // setDate************************************************
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay = DateTime.now();
  void dateChange(DateTime selectedday, DateTime focusedday) {
    selectedDay = selectedday;
    focusedDay = focusedday;
    emit(DateChangeState(selectedDay!, focusedDay));
  }

  // setTime************************************************

  String? select;
  void timeChange(String time) {
    select = time;
    emit(TimeChangeState(select!));
  }

  bool isChanged(String time) {
    return select == time;
  }

  // reviewSummary********************************************
  String name = "";
  String type = "";
  int salary = 100;
  String fullAddress = "";
  String homeNo = "";
  String streetNo = "";
  DateTime? date;
  String time = "";

  void setName(String n) {
    name = n;
    emit(SetItem());
  }

  void setType(String n) {
    type = n;
    emit(SetItem());
  }

  void setSalary(int n) {
    salary = n;
    emit(SetItem());
  }

  void setAddress(String n) {
    fullAddress = n;
    emit(SetItem());
  }

  void setHome(String n) {
    homeNo = n;
    emit(SetItem());
  }

  void setStreet(String n) {
    streetNo = n;
    emit(SetItem());
  }

  void setDate() {
    date = selectedDay!;
    emit(SetItem());
  }

  void setTime() {
    if (select != null && select!.isNotEmpty) {
      time = select!;
      emit(TimeSuccessState());
    } else {
      emit(TimeErrorState());
    }
  }

  void clearAll() {
    name = "";
    type = "";
    fullAddress = "";
    homeNo = "";
    streetNo = "";
    date;
    time = "";
    emit(InfoResetState());
  }
}
