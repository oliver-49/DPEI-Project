import 'package:bloc/bloc.dart';
import 'package:dpei_project/presentation/screens/account_service/Upload%20documents/upload_documents_state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

class UploadDocumentsCubit extends Cubit<UploadDocumentsState> {
  UploadDocumentsCubit() : super(const UploadDocumentsInitial());

  Future<void> pickFile({required String type}) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
      );

      if (result != null) {
        final filePath = result.files.single.path;

        emit(
          UploadDocumentsLoading(
            licensePath: state.licensePath,
            certificationPath: state.certificationPath,
          ),
        );

        await Future.delayed(const Duration(milliseconds: 500));

        if (type == 'license') {
          emit(
            UploadDocumentsSuccess(
              licensePath: filePath,
              certificationPath: state.certificationPath,
            ),
          );
        } else if (type == 'certification') {
          emit(
            UploadDocumentsSuccess(
              licensePath: state.licensePath,
              certificationPath: filePath,
            ),
          );
        }
      } else {}
    } catch (e) {
      emit(
        UploadDocumentsFailure(
          errorMessage:
              'An error occurred during file picking: ${e.toString()}',
          licensePath: state.licensePath,
          certificationPath: state.certificationPath,
        ),
      );
      debugPrint('File Picker Error: $e');
    }
  }

  bool isNextButtonEnabled() {
    return state.licensePath != null && state.certificationPath != null;
  }
}
