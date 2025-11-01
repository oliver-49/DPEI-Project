import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fixit/gitHub/presentation/widgets/custombutton.dart';
import 'package:fixit/gitHub/presentation/screens/account_service/service_offer/work_hour/workhour_view.dart';
import 'service_offer_cubit.dart';
import 'service_offer_state.dart';
import 'package:fixit/l10n/app_localizations.dart';

class ServiceOffer extends StatelessWidget {
  const ServiceOffer({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return BlocProvider(
      create: (_) => ServiceOfferCubit(),
      child: BlocBuilder<ServiceOfferCubit, ServiceOfferState>(
        builder: (context, state) {
          final cubit = context.read<ServiceOfferCubit>();

          final servicesOptions = [
            AppLocalizations.of(context)!.plumbing,
            AppLocalizations.of(context)!.electricity,
            AppLocalizations.of(context)!.cleaning,
            AppLocalizations.of(context)!.painting,
            AppLocalizations.of(context)!.gardening,
          ];

          final governoratesOptions = [
            AppLocalizations.of(context)!.cairo,
            AppLocalizations.of(context)!.giza,
            AppLocalizations.of(context)!.alexandria,
            AppLocalizations.of(context)!.luxor,
            AppLocalizations.of(context)!.aswan,
            AppLocalizations.of(context)!.suez,
            AppLocalizations.of(context)!.dakahlia,
            AppLocalizations.of(context)!.sharqia,
            AppLocalizations.of(context)!.beheira,
            AppLocalizations.of(context)!.menofia,
            AppLocalizations.of(context)!.minya,
            AppLocalizations.of(context)!.ismailia,
            AppLocalizations.of(context)!.qalyubia,
            AppLocalizations.of(context)!.gharbia,
            AppLocalizations.of(context)!.fayoum,
          ];

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
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.serviceOfferTitle,
                    style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff565656),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.06),

                  buildDropdownField(
                    context,
                    AppLocalizations.of(context)!.selectService,
                    state.selectedService,
                    (value) => cubit.selectService(value!),
                    servicesOptions,
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  buildDropdownField(
                    context,
                    AppLocalizations.of(context)!.selectExperience,
                    state.selectedExperience,
                    (value) => cubit.selectExperience(value!),
                    [
                      '1 سنة',
                      '2 سنة',
                      '3 سنوات',
                      '5 سنوات',
                      'أكثر من 5 سنوات',
                    ].map((e) => e).toList(),
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  buildDropdownField(
                    context,
                    AppLocalizations.of(context)!.selectServiceArea,
                    state.selectedArea,
                    (value) => cubit.selectArea(value!),
                    governoratesOptions,
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.17),

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
                                MaterialPageRoute(builder: (_) => Workhour()),
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

  Widget buildDropdownField(
    BuildContext context,
    String hintText,
    String? selectedValue,
    Function(String?) onChanged,
    List<String> items,
    double screenWidth,
    double screenHeight,
  ) {
    return DropdownButtonFormField<String>(
      initialValue: selectedValue,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff0054A5)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Color(0xffCACACA), width: 1),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.085,
          vertical: screenHeight * 0.037,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: screenWidth * 0.035,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          color: const Color(0xff5C5F62),
        ),
      ),
      items: items
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: onChanged,
    );
  }
}
