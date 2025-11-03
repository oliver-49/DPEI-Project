class VerificationState {}

class VerificationInitial extends VerificationState {}

class VerificationSelected extends VerificationState {
  final String method;
  VerificationSelected(this.method);
}

class VerificationNext extends VerificationState {
  final String method;
  VerificationNext(this.method);
}

class VerificationError extends VerificationState {
  final String message;
  VerificationError(this.message);
}
