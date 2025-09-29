import 'package:dpei_project/presentation/screens/account_service/Upload%20documents/upload_documents_cubit.dart';
import 'package:dpei_project/presentation/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadDocuments extends StatelessWidget {
  const UploadDocuments({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
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
                      "We need a few Documents.",
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
                      label: 'Upload your service license',
                      fileType: 'license',
                      filePath: state.licensePath,
                      onPressed: () {
                        cubit.pickFile(type: 'license');
                      },
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                    ),
                    SizedBox(height: screenHeight * 0.06),
                    _buildUploadButton(
                      context,
                      label: 'Upload your certification',
                      fileType: 'certification',
                      filePath: state.certificationPath,
                      onPressed: () {
                        cubit.pickFile(type: 'certification');
                      },
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                    ),
                    SizedBox(height: screenHeight * 0.16),
                    buttonItem(context, text: 'Next', onPressed: () {
                      // Handle next button press
                    }),
                  ],
                ),
              ),
            );
          },
        ),
    );
  }

  Widget _buildUploadButton(
    BuildContext context, {
    required String label,
    required String fileType,
    String? filePath,
    required VoidCallback onPressed,
    required double screenWidth,
    required double screenHeight,
  }) {
  
    final buttonText = filePath != null ? 'Change' : 'Upload';
    final buttonTextColor =
        filePath != null ? const Color(0xff0054A5) : const Color(0xff0054A5);
    final borderColor =
        filePath != null ? Colors.transparent : const Color(0xff0054A5);
    final paddingHorizontal =
        filePath != null ? 16.0 : 0.0; // Add padding when file is uploaded
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
              border: Border.all(
                color: borderColor,
                width: 1,
              ),
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
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: buttonTextColor, size: screenWidth * 0.05),
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
                if (filePath != null)
                  Text(
                    buttonText,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: buttonTextColor,
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