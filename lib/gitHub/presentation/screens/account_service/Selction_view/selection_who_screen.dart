import 'package:fixit/gitHub/core/stores/app_box.dart';
import 'package:fixit/l10n/app_localizations.dart';
import 'package:fixit/gitHub/presentation/homescreen.dart';
import 'package:fixit/gitHub/presentation/screens/account_service/Phone%20number/phoneNumber_screen/phone_screen.dart';
import 'package:fixit/gitHub/presentation/widgets/widgets.dart';
import 'package:fixit/gitHub/presentation/screens/customescreens/customer_phone/customer_phone_view.dart';
import 'package:fixit/gitHub/presentation/widgets/custombutton.dart';
import 'package:fixit/userModel/service_provider_model.dart';
import 'package:fixit/userModel/service_provider_state.dart';
import 'package:fixit/ye/Main_Home/home_screen.dart';
import 'package:fixit/ye/Main_Home/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'selection_cubit.dart';

class AccountSetup extends StatelessWidget {
  final ServiceProviderModel provider;
  const AccountSetup({required this.provider});

  @override
  Widget build(BuildContext context) {

    // if (AppBox.isSetupDone()) {
    //   Future.microtask(() {
    //     Navigator.pushAndRemoveUntil(
    //       // ignore: use_build_context_synchronously
    //       context,
    //       MaterialPageRoute(builder: (_) =>  NavigationPage()),
    //       (route) => false,
    //     );
    //   });
    //   return const SizedBox.shrink();
    // }
  
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    bool providerr=false;

    // ✅ BlocProvider اتحذف من هنا
    return BlocListener<SelectionCubit, SelectionState>(
      listener: (context, state) async {
        if (state.navigateNext) {
          context.read<SelectionCubit>().resetNavigation();

          if (state.selectedRole == 'Service Provider') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) =>  PhoneNumberView(provider: provider)),
            );
          } else if (state.selectedRole == 'Looking for service') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) =>  CustomerPhoneView(provider: provider))//provider: provider)),
            );
          }
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
                        onTap: () {
                          providerr=true;
                            context
                            .read<SelectionCubit>()
                            .selectOption('Service Provider');}
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      containerItem(
                        text1: AppLocalizations.of(context)!.roleCustomerTitle,
                        text2: AppLocalizations.of(
                          context,
                        )!.roleCustomerSubtitle,
                        isSelected: state.selectedRole == 'Looking for service',
                        onTap: () { 
                           providerr=false;
                          context
                            .read<SelectionCubit>()
                            .selectOption('Looking for service');}
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
                onPressed: () { 
                  
                  provider.role= providerr? 'provider'
                       : 'customer';
                    

                            print("-------------------/n");
                            print('User model: ${provider}');


                  context.read<SelectionCubit>().onNextTapped();},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
