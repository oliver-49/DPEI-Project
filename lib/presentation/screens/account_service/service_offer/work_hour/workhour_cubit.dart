import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fixit/core/stores/app_box.dart';
import 'workhour_state.dart';

class WorkhourCubit extends Cubit<WorkhourState> {
  WorkhourCubit() : super(const WorkhourState());

  void setFromTime(TimeOfDay value) {
    emit(state.copyWith(fromTime: value, errorMessage: null));

    final formatted =
        '${value.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}';
    AppBox.box.put('from_time', formatted);
  }

  void setToTime(TimeOfDay value) {
    emit(state.copyWith(toTime: value, errorMessage: null));

    final formatted =
        '${value.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}';
    AppBox.box.put('to_time', formatted);
  }

  Future<void> saveDataLocally() async {
    if (state.fromTime != null) {
      final formatted =
          '${state.fromTime!.hour.toString().padLeft(2, '0')}:${state.fromTime!.minute.toString().padLeft(2, '0')}';
      await AppBox.box.put('from_time', formatted);
    }

    if (state.toTime != null) {
      final formatted =
          '${state.toTime!.hour.toString().padLeft(2, '0')}:${state.toTime!.minute.toString().padLeft(2, '0')}';
      await AppBox.box.put('to_time', formatted);
    }
  }

  int _toMinutes(TimeOfDay t) => t.hour * 60 + t.minute;

  Future<bool> submitToFirebase() async {
    final from = state.fromTime;
    final to = state.toTime;

    if (from == null || to == null) {
      emit(state.copyWith(errorMessage: 'يرجى اختيار وقتي البداية والنهاية'));
      return false;
    }

    if (_toMinutes(from) >= _toMinutes(to)) {
      emit(state.copyWith(errorMessage: 'وقت البداية يجب أن يسبق وقت النهاية'));
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
