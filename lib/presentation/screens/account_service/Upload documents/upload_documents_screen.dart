import 'package:dpei_project/presentation/screens/account_service/Upload%20documents/upload_documents_cubit.dart';
import 'package:dpei_project/presentation/screens/account_service/Upload%20documents/upload_documents_state.dart';
import 'package:dpei_project/presentation/screens/account_service/acount_details/details_view.dart';
import 'package:dpei_project/presentation/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dpei_project/l10n/app_localizations.dart';

class UploadDocuments extends StatelessWidget {
  const UploadDocuments({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return BlocProvider(
      create: (context) => UploadDocumentsCubit(),
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
          backgroundColor: const Color(0xffFFFFFF),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                child: Image.asset(
                  'assets/images/uploadfram.png',
                  width: screenWidth * 3,
                ),
              ),
            ),
          ),
          body: BlocBuilder<UploadDocumentsCubit, UploadDocumentsState>(
            builder: (context, state) {
              final cubit = context.read<UploadDocumentsCubit>();
              final bool isLoading = state is UploadDocumentsLoading;
              final bool isNextEnabled = cubit.isNextButtonEnabled();

              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.04,
                    left: screenWidth * 0.06,
                    right: screenWidth * 0.06,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.documentsTitle,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff565656),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),

                      _buildUploadButton(
                        context,
                        label: AppLocalizations.of(
                          context,
                        )!.uploadServiceLicense,
                        filePath: state.licensePath,
                        onPressed: isLoading
                            ? () {}
                            : () {
                                cubit.pickFile(type: 'license');
                              },
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        isLoading: isLoading && state.licensePath == null,
                      ),
                      SizedBox(height: screenHeight * 0.06),

                      _buildUploadButton(
                        context,
                        label: AppLocalizations.of(
                          context,
                        )!.uploadCertification,
                        filePath: state.certificationPath,
                        onPressed: isLoading
                            ? () {}
                            : () {
                                cubit.pickFile(type: 'certification');
                              },
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        isLoading: isLoading && state.certificationPath == null,
                      ),
                      SizedBox(height: screenHeight * 0.16),

                      buttonItem(
                        context,
                        text: isLoading
                            ? AppLocalizations.of(context)!.loading
                            : AppLocalizations.of(context)!.nextButton,
                        onPressed: isNextEnabled && !isLoading
                            ? () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AcountDetails(),
                                ),
                              )
                            : null,
                      ),
                    ],
                  ),
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
    String? filePath,
    required VoidCallback onPressed,
    required double screenWidth,
    required double screenHeight,
    required bool isLoading,
  }) {
    final buttonText = filePath != null
        ? AppLocalizations.of(context)!.change
        : AppLocalizations.of(context)!.upload;

    final buttonTextColor = const Color(0xff0054A5);
    final borderColor = filePath != null
        ? const Color(0xffE0E0E0)
        : const Color(0xff0054A5);
    final paddingHorizontal = filePath != null ? 16.0 : 0.0;
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
            padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: borderColor, width: 1),
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Row(
              mainAxisAlignment: filePath != null
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: [
                if (filePath != null)
                  Expanded(
                    child: Text(
                      filePath.split('/').last,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.black,
                      ),
                    ),
                  )
                else if (isLoading)
                  SizedBox(
                    width: screenWidth * 0.05,
                    height: screenWidth * 0.05,
                    child: const CircularProgressIndicator(
                      color: Color(0xff0054A5),
                      strokeWidth: 2,
                    ),
                  )
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: buttonTextColor,
                        size: screenWidth * 0.05,
                      ),
                      SizedBox(width: screenWidth * 0.015),
                      Text(
                        buttonText,
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          color: buttonTextColor,
                        ),
                      ),
                    ],
                  ),

                if (filePath != null && !isLoading)
                  Text(
                    buttonText,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: buttonTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
