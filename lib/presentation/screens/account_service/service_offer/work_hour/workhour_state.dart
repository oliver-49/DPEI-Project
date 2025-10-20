class WorkhourState {
  final String? fromTime;
  final String? toTime;
  final bool isLoading;
  final String? errorMessage;

  WorkhourState({
    this.fromTime,
    this.toTime,
    this.isLoading = false,
    this.errorMessage,
  });

  WorkhourState copyWith({
    String? fromTime,
    String? toTime,
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
