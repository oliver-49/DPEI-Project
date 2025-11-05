import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fixit/presentation/screens/account_service/Upload%20documents/upload_documents_state.dart';
import 'package:flutter/foundation.dart';
import 'package:fixit/core/stores/app_box.dart';

class UploadDocumentsCubit extends Cubit<UploadDocumentsState> {
  UploadDocumentsCubit() : super(const UploadDocumentsInitial());

  Future<void> pickFile({required String type}) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
        withData: true,
      );

      if (result != null && result.files.single.bytes != null) {
        final fileBytes = result.files.single.bytes!;

        if (type == 'license') {
          await AppBox.box.put('license_file', fileBytes);

          emit(
            UploadDocumentsSuccess(
              licenseBytes: fileBytes,
              certificationBytes: state.certificationBytes,
            ),
          );
        } else if (type == 'certification') {
          await AppBox.box.put('certification_file', fileBytes);

          emit(
            UploadDocumentsSuccess(
              licenseBytes: state.licenseBytes,
              certificationBytes: fileBytes,
            ),
          );
        }
      }
    } catch (e) {
      emit(
        UploadDocumentsFailure(
          errorMessage: 'Error picking file: $e',
          licenseBytes: state.licenseBytes,
          certificationBytes: state.certificationBytes,
        ),
      );
      debugPrint('File Picker Error: $e');
    }
  }

  bool isNextButtonEnabled() {
    return state.licenseBytes != null && state.certificationBytes != null;
  }
}
