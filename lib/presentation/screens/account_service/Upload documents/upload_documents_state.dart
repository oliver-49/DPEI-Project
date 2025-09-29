part of 'upload_documents_cubit.dart';

sealed class UploadDocumentsState extends Equatable {
  final String? licensePath;
  final String? certificationPath;

  const UploadDocumentsState({this.licensePath, this.certificationPath});

  @override
  List<Object?> get props => [licensePath, certificationPath];
}

final class UploadDocumentsInitial extends UploadDocumentsState {
  const UploadDocumentsInitial() : super(licensePath: null, certificationPath: null);
}

final class UploadDocumentsLoading extends UploadDocumentsState {}

final class UploadDocumentsSuccess extends UploadDocumentsState {
  const UploadDocumentsSuccess({
    required super.licensePath,
    required super.certificationPath,
  });
}

final class UploadDocumentsFailure extends UploadDocumentsState {
  final String errorMessage;
  const UploadDocumentsFailure({required this.errorMessage});
  
  @override
  List<Object?> get props => [errorMessage];
}