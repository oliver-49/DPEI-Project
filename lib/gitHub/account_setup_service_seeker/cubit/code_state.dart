abstract class VerifyState {}

class VerifyInitial extends VerifyState {}

class VerifyLoading extends VerifyState {}

class VerifySuccess extends VerifyState {}

class VerifyError extends VerifyState {
  final String message;
  VerifyError(this.message);
}
