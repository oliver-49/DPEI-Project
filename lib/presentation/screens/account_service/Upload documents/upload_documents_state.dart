import 'package:equatable/equatable.dart';

sealed class UploadDocumentsState extends Equatable {
  final String? licensePath;
  final String? certificationPath;

  const UploadDocumentsState({this.licensePath, this.certificationPath});

  @override
  List<Object?> get props => [licensePath, certificationPath];
}

final class UploadDocumentsInitial extends UploadDocumentsState {
  const UploadDocumentsInitial()
    : super(licensePath: null, certificationPath: null);
}

final class UploadDocumentsLoading extends UploadDocumentsState {
  const UploadDocumentsLoading({super.licensePath, super.certificationPath});

  @override
  List<Object?> get props => [licensePath, certificationPath];
}

final class UploadDocumentsSuccess extends UploadDocumentsState {
  const UploadDocumentsSuccess({
    required super.licensePath,
    required super.certificationPath,
  });
}

final class UploadDocumentsFailure extends UploadDocumentsState {
  final String errorMessage;

  const UploadDocumentsFailure({
    required this.errorMessage,
    super.licensePath,
    super.certificationPath,
  });

  @override
  List<Object?> get props => [errorMessage, licensePath, certificationPath];
}

// // لكن الكود اللي فوق لو هعرض علي موبايل  web لو هعرض علي
// //***************************************************************  */

// import 'package:equatable/equatable.dart';
// import 'dart:typed_data'; // لاستخدام Uint8List

// sealed class UploadDocumentsState extends Equatable {
//   final String? licensePath;
//   final String? certificationPath;

//   final Uint8List? licenseBytes;
//   final Uint8List? certificationBytes;

//   const UploadDocumentsState({
//     this.licensePath,
//     this.certificationPath,
//     this.licenseBytes,
//     this.certificationBytes,
//   });

//   @override
//   List<Object?> get props => [
//     licensePath,
//     certificationPath,
//     licenseBytes,
//     certificationBytes,
//   ];
// }

// final class UploadDocumentsInitial extends UploadDocumentsState {
//   const UploadDocumentsInitial()
//     : super(licensePath: null, certificationPath: null);
// }

// final class UploadDocumentsLoading extends UploadDocumentsState {
//   const UploadDocumentsLoading({
//     super.licensePath,
//     super.certificationPath,
//     super.licenseBytes,
//     super.certificationBytes,
//   });

//   @override
//   List<Object?> get props => [
//     licensePath,
//     certificationPath,
//     licenseBytes,
//     certificationBytes,
//   ];
// }

// final class UploadDocumentsSuccess extends UploadDocumentsState {
//   const UploadDocumentsSuccess({
//     required super.licensePath,
//     required super.certificationPath,
//     required super.licenseBytes,
//     required super.certificationBytes,
//   });
// }

// final class UploadDocumentsFailure extends UploadDocumentsState {
//   final String errorMessage;

//   const UploadDocumentsFailure({
//     required this.errorMessage,
//     super.licensePath,
//     super.certificationPath,
//     super.licenseBytes,
//     super.certificationBytes,
//   });

//   @override
//   List<Object?> get props => [
//     errorMessage,
//     licensePath,
//     certificationPath,
//     licenseBytes,
//     certificationBytes,
//   ];
// }
