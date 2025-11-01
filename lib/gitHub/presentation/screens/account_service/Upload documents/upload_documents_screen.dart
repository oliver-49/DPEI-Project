import 'package:fixit/gitHub/presentation/screens/account_service/Upload%20documents/upload_documents_cubit.dart';
import 'package:fixit/gitHub/presentation/screens/account_service/Upload%20documents/upload_documents_state.dart';
import 'package:fixit/gitHub/presentation/screens/account_service/acount_details/details_view.dart';
import 'package:fixit/gitHub/presentation/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fixit/l10n/app_localizations.dart';

class UploadDocuments extends StatelessWidget {
  const UploadDocuments({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (_) => UploadDocumentsCubit(),
      child: BlocListener<UploadDocumentsCubit, UploadDocumentsState>(
        listener: (context, state) {
          if (state is UploadDocumentsFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: InkWell(
              onTap: () => Navigator.pop(context),
              child: Image.asset(
                'assets/images/uploadfram.png',
                width: screenWidth * 3,
              ),
            ),
          ),
          body: BlocBuilder<UploadDocumentsCubit, UploadDocumentsState>(
            builder: (context, state) {
              final cubit = context.read<UploadDocumentsCubit>();
              final bool isLoading = state is UploadDocumentsLoading;
              final bool isNextEnabled = cubit.isNextButtonEnabled();

              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.06,
                  vertical: screenHeight * 0.04,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.documentsTitle,
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    _buildUploadButton(
                      context,
                      label: AppLocalizations.of(context)!.uploadServiceLicense,
                      fileSelected: state.licenseBytes != null,
                      onPressed: () => cubit.pickFile(type: 'license'),
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      isLoading: isLoading && state.licenseBytes == null,
                    ),
                    SizedBox(height: screenHeight * 0.06),
                    _buildUploadButton(
                      context,
                      label: AppLocalizations.of(context)!.uploadCertification,
                      fileSelected: state.certificationBytes != null,
                      onPressed: () => cubit.pickFile(type: 'certification'),
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      isLoading: isLoading && state.certificationBytes == null,
                    ),
                    SizedBox(height: screenHeight * 0.16),
                    buttonItem(
                      context,
                      text: AppLocalizations.of(context)!.nextButton,
                      onPressed: isNextEnabled
                          ? () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const AcountDetails(),
                              ),
                            )
                          : null,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildUploadButton(
    BuildContext context, {
    required String label,
    required bool fileSelected,
    required VoidCallback onPressed,
    required double screenWidth,
    required double screenHeight,
    required bool isLoading,
  }) {
    final buttonText = fileSelected
        ? AppLocalizations.of(context)!.change
        : AppLocalizations.of(context)!.upload;

    final buttonTextColor = const Color(0xff0054A5);
    final borderColor = fileSelected
        ? const Color(0xffE0E0E0)
        : const Color(0xff0054A5);

    final buttonHeight = screenHeight * 0.06;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.w400,
            color: const Color(0xff565656),
          ),
        ),
        SizedBox(height: screenHeight * 0.015),
        GestureDetector(
          onTap: onPressed,
          child: Container(
            height: buttonHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: borderColor, width: 1),
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Center(
              child: isLoading
                  ? SizedBox(
                      width: screenWidth * 0.05,
                      height: screenWidth * 0.05,
                      child: const CircularProgressIndicator(
                        color: Color(0xff0054A5),
                        strokeWidth: 2,
                      ),
                    )
                  : Text(
                      buttonText,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: buttonTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
