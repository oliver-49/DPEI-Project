import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class BorderCubit extends Cubit<Color> {
  BorderCubit() : super(const Color(0xffCACACA)); 

  void changeBorder(Color color) {
    emit(color);
  }
}
