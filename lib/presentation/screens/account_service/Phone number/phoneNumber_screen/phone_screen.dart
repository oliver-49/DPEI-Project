import 'package:country_code_picker/country_code_picker.dart';
import 'package:dpei_project/l10n/app_localizations.dart';
import 'package:dpei_project/presentation/screens/account_service/Phone%20number/verify%20code/verify_screen.dart';
import 'package:dpei_project/presentation/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'phone_cubit.dart';

class PhoneNumberView extends StatelessWidget {
  const PhoneNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final phoneController = TextEditingController();

    return BlocProvider(
      create: (_) => PhoneNumberCubit(),
      child: BlocBuilder<PhoneNumberCubit, PhoneNumberState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.09,
                      bottom: screenHeight * 0.06,
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.enterPhoneTitle,
                      style: TextStyle(
                        color: const Color(0xff565656),
                        fontSize: screenWidth * 0.045,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => context.read<PhoneNumberCubit>().changeBorder(
                      const Color(0xff0054A5),
                    ),
                    child: Container(
                      height: screenHeight * 0.07,
                      width: screenWidth * 0.85,
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.06,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: state.borderColor, width: 1),
                      ),
                      child: Row(
                        children: [
                          CountryCodePicker(
                            onChanged: (code) => context
                                .read<PhoneNumberCubit>()
                                .setCountryCode(code.dialCode!),
                            initialSelection: 'EG',
                            favorite: const ['+20', 'EG'],
                            showCountryOnly: true,
                          ),
                          Expanded(
                            child: TextField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              onChanged: (value) => context
                                  .read<PhoneNumberCubit>()
                                  .setPhone(value),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "10380480244",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.1),
                  buttonItem(
                    context,
                    text: AppLocalizations.of(context)!.sendCodeButton,
                    onPressed: () {
                      final cubit = context.read<PhoneNumberCubit>();
                      final error = cubit.validatePhone();
                      if (error != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(error),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }
                      final fullNumber =
                          '${cubit.state.countryCode}${cubit.state.phone}';

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => VerifyCode(phoneNumber: fullNumber),
                        ),
                      );
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
}
