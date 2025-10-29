import 'package:equatable/equatable.dart';
import 'dart:typed_data';

sealed class UploadDocumentsState extends Equatable {
  final Uint8List? licenseBytes;
  final Uint8List? certificationBytes;

  const UploadDocumentsState({this.licenseBytes, this.certificationBytes});

  @override
  List<Object?> get props => [licenseBytes, certificationBytes];
}

final class UploadDocumentsInitial extends UploadDocumentsState {
  const UploadDocumentsInitial()
    : super(licenseBytes: null, certificationBytes: null);
}

final class UploadDocumentsLoading extends UploadDocumentsState {
  const UploadDocumentsLoading({super.licenseBytes, super.certificationBytes});
}

final class UploadDocumentsSuccess extends UploadDocumentsState {
  const UploadDocumentsSuccess({super.licenseBytes, super.certificationBytes});
}

final class UploadDocumentsFailure extends UploadDocumentsState {
  final String errorMessage;

  const UploadDocumentsFailure({
    required this.errorMessage,
    super.licenseBytes,
    super.certificationBytes,
  });

  @override
  List<Object?> get props => [errorMessage, licenseBytes, certificationBytes];
}
