import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

part 'upload_documents_state.dart';

class UploadDocumentsCubit extends Cubit<UploadDocumentsState> {
  UploadDocumentsCubit() : super(UploadDocumentsInitial());

  Future<void> pickFile({required String type}) async {
    try {
      final result = await FilePicker.platform.pickFiles();

      if (result != null) {
        final filePath = result.files.single.path;
        emit(UploadDocumentsLoading());

        // Here you can add your logic to upload the file to a server
        // For now, we just update the state with the file path
        
        if (type == 'license') {
          emit(UploadDocumentsSuccess(licensePath: filePath, certificationPath: state.certificationPath));
        } else if (type == 'certification') {
          emit(UploadDocumentsSuccess(licensePath: state.licensePath, certificationPath: filePath));
        }

      } else {
        // User canceled the picker
      }
    } catch (e) {
      emit(UploadDocumentsFailure(errorMessage: e.toString()));
    }
  }
}