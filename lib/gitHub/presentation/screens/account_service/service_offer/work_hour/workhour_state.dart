import 'package:flutter/material.dart';

class WorkhourState {
  final TimeOfDay? fromTime;
  final TimeOfDay? toTime;
  final bool isLoading;
  final String? errorMessage;

  const WorkhourState({
    this.fromTime,
    this.toTime,
    this.isLoading = false,
    this.errorMessage,
  });

  WorkhourState copyWith({
    TimeOfDay? fromTime,
    TimeOfDay? toTime,
    bool? isLoading,
    String? errorMessage,
  }) {
    return WorkhourState(
      fromTime: fromTime ?? this.fromTime,
      toTime: toTime ?? this.toTime,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}
