import 'package:fixit/firebase/work_hour.dart';
import 'package:fixit/l10n/app_localizations.dart';
import 'package:fixit/gitHub/presentation/screens/account_service/Upload%20documents/upload_documents_screen.dart';
import 'package:fixit/gitHub/presentation/screens/account_service/service_offer/work_hour/workhour_state.dart';
import 'package:fixit/gitHub/presentation/widgets/custombutton.dart';
import 'package:fixit/userModel/service_provider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'workhour_cubit.dart';

class Workhour extends StatelessWidget {
  final ServiceProviderModel provider;
  
  const Workhour({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    String formatTime(BuildContext ctx, TimeOfDay? t) {
      if (t == null) return '';

      MaterialLocalizations.of(ctx);

      final h = t.hour.toString().padLeft(2, '0');
      final m = t.minute.toString().padLeft(2, '0');
      return '$h:$m';
    }

    Future<void> pickTime({
      required BuildContext ctx,
      required TimeOfDay? initial,
      required ValueChanged<TimeOfDay> onPicked,
    }) async {
      final picked = await showTimePicker(
        context: ctx,
        initialTime: initial ?? TimeOfDay.now(),
        initialEntryMode: TimePickerEntryMode.dial,
        builder: (context, child) {
          final mq = MediaQuery.of(context);
          return MediaQuery(
            data: mq.copyWith(alwaysUse24HourFormat: true),
            child: child!,
          );
        },
      );
      if (picked != null) onPicked(picked);
    }

    return BlocProvider(
      create: (_) => WorkhourCubit(),
      child: BlocBuilder<WorkhourCubit, WorkhourState>(
        builder: (context, state) {
          final cubit = context.read<WorkhourCubit>();

          final fromCtrl = TextEditingController(
            text: formatTime(context, state.fromTime),
          );
          final toCtrl = TextEditingController(
            text: formatTime(context, state.toTime),
          );

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

                  _buildTimeField(
                    context: context,
                    label: AppLocalizations.of(context)!.from,
                    controller: fromCtrl,
                    onTap: () => pickTime(
                      ctx: context,
                      initial: state.fromTime,
                      onPicked: cubit.setFromTime,
                    ),
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  _buildTimeField(
                    context: context,
                    label: AppLocalizations.of(context)!.to,
                    controller: toCtrl,
                    onTap: () => pickTime(
                      ctx: context,
                      initial: state.toTime,
                      onPicked: cubit.setToTime,
                    ),
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.04),

                  if (state.errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        state.errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),

                  SizedBox(height: screenHeight * 0.08),

                  buttonItem(
                    context,
                    text: state.isLoading
                        ? AppLocalizations.of(context)!.loading
                        : AppLocalizations.of(context)!.nextButton,
                    onPressed: state.isLoading
                        ? null
                        : () async {
                            FocusScope.of(context).unfocus();
                            cubit.saveDataLocally();
                            final ok = await cubit.submitToFirebase();
                            if (!ok) return;

                            if (context.mounted) {
                              await WorkHourMode().setUserWorkHour(
                                startingTime: cubit.state.fromTime!,
                               endingTime: cubit.state.toTime!);
                             
                              provider.startingTime=cubit.state.fromTime!.toString();
                               provider.endingTime=cubit.state.toTime!.toString();
                              print("-----------------/n");
                              print(provider);
                               Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>  UploadDocuments(provider:provider),
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

  Widget _buildTimeField({
    required BuildContext context,
    required String label,
    required TextEditingController controller,
    required VoidCallback onTap,
    required double screenWidth,
    required double screenHeight,
  }) {
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
            controller: controller,
            readOnly: true,
            showCursor: false,
            onTap: onTap,
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
              suffixIcon: const Icon(Icons.access_time),
            ),
          ),
        ),
      ],
    );
  }
}
