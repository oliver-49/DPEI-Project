import 'package:fixit/gitHub/presentation/screens/account_service/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fixit/l10n/app_localizations.dart';
import 'package:fixit/gitHub/presentation/screens/account_service/Phone%20number/phoneNumber_screen/phone_screen.dart';
import 'package:fixit/gitHub/presentation/screens/customescreens/customerphone.dart';
import 'package:fixit/gitHub/presentation/widgets/custombutton.dart';
import 'selection_cubit.dart';

class AccountSetup extends StatelessWidget {
  const AccountSetup({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return BlocListener<SelectionCubit, SelectionState>(
      listener: (context, state) {
        if (state.navigateNext) {
          if (state.selectedRole == 'Service Provider') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PhoneNumberView()),
            );
          } else if (state.selectedRole == 'Looking for service') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Customerphone()),
            );
          }
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: InkWell(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
              child: Image.asset(
                'assets/images/fram2.png',
                width: screenWidth * 3,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.04,
                  right: screenWidth * 0.5,
                ),
                child: Text(
                  AppLocalizations.of(context)!.accountSetupTitle,
                  style: const TextStyle(
                    color: Color(0xff565656),
                    fontSize: 48,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              BlocBuilder<SelectionCubit, SelectionState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      containerItem(
                        text1: AppLocalizations.of(context)!.roleProviderTitle,
                        text2: AppLocalizations.of(
                          context,
                        )!.roleProviderSubtitle,
                        isSelected: state.selectedRole == 'Service Provider',
                        onTap: () => context
                            .read<SelectionCubit>()
                            .selectOption('Service Provider'),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      containerItem(
                        text1: AppLocalizations.of(context)!.roleCustomerTitle,
                        text2: AppLocalizations.of(
                          context,
                        )!.roleCustomerSubtitle,
                        isSelected: state.selectedRole == 'Looking for service',
                        onTap: () => context
                            .read<SelectionCubit>()
                            .selectOption('Looking for service'),
                      ),
                      if (state.errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Center(
                            child: Text(
                              state.errorMessage!,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: screenWidth * 0.035,
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
              SizedBox(height: screenHeight * 0.06),
              buttonItem(
                context,
                text: AppLocalizations.of(context)!.nextButton,
                onPressed: () => context.read<SelectionCubit>().onNextTapped(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
