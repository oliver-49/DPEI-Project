
import 'package:fixit/l10n/app_localizations.dart';
import 'package:fixit/presentation/screens/account_service/Upload%20documents/upload_documents_screen.dart';
import 'package:fixit/presentation/screens/account_service/service_offer/work_hour/workhour_state.dart';
import 'package:fixit/presentation/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'workhour_cubit.dart';


class Workhour extends StatelessWidget {
  const Workhour({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return BlocProvider(
      create: (_) => WorkhourCubit(),
      child: BlocBuilder<WorkhourCubit, WorkhourState>(
        builder: (context, state) {
          final cubit = context.read<WorkhourCubit>();

          return Scaffold(
            backgroundColor: const Color(0xffFFFFFF),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              title: InkWell(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                  child: Image.asset(
                    'assets/images/aboutoffer.png',
                    width: screenWidth * 3,
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.only(
                right: screenWidth * 0.06,
                left: screenWidth * 0.06,
                top: screenHeight * 0.04,
                bottom: screenHeight * 0.2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.serviceWorkingHours,
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff565656),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  buildTimeField(
                    context,
                    AppLocalizations.of(context)!.from,
                    state.fromTime,
                    (value) => cubit.setFromTime(value),
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  buildTimeField(
                    context,
                    AppLocalizations.of(context)!.to,
                    state.toTime,
                    (value) => cubit.setToTime(value),
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.15),

                  if (state.errorMessage != null)
                    Text(
                      state.errorMessage!,
                      style: TextStyle(color: Colors.red),
                    ),

                  buttonItem(
                    context,
                    text: state.isLoading
                        ? AppLocalizations.of(context)!.loading
                        : AppLocalizations.of(context)!.nextButton,
                    onPressed: state.isLoading
                        ? null
                        : () {
                            cubit.saveDataLocally();
                            cubit.submitToFirebase();
                            if (!state.isLoading &&
                                state.errorMessage == null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => UploadDocuments(),
                                ),
                              );
                            }
                          },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildTimeField(
    BuildContext context,
    String label,
    String? initialValue,
    Function(String) onChanged,
    double screenWidth,
    double screenHeight,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
          ),
        ),
        SizedBox(height: screenHeight * 0.005),
        SizedBox(
          width: screenWidth * 0.85,
          height: screenHeight * 0.07,
          child: TextFormField(
            initialValue: initialValue,
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff0054A5)),
              ),
              hintText: 'HH:MM',
              hintStyle: TextStyle(fontSize: screenWidth * 0.035),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
                borderSide: const BorderSide(color: Color(0xffCACACA)),
              ),
            ),
            keyboardType: TextInputType.datetime,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
