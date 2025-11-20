import 'package:country_code_picker/country_code_picker.dart';
import 'package:fixit/firebase/phone_mode.dart';
import 'package:fixit/l10n/app_localizations.dart';
import 'package:fixit/gitHub/presentation/screens/account_service/Phone%20number/verify%20code/verify_screen.dart';
import 'package:fixit/gitHub/presentation/widgets/custombutton.dart';
import 'package:fixit/userModel/service_provider_model.dart';
import 'package:fixit/userModel/service_provider_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'phone_cubit.dart';

class PhoneNumberView extends StatelessWidget {
   final ServiceProviderModel provider;
  const PhoneNumberView({super.key, required this.provider});

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
          final cubit = context.read<PhoneNumberCubit>();

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
                    onTap: () => cubit.changeBorder(const Color(0xff0054A5)),
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
                            onChanged: (code) =>
                                cubit.setCountryCode(code.dialCode!),
                            initialSelection: 'EG',
                            favorite: const ['+20', 'EG'],
                            showCountryOnly: true,
                          ),
                          Expanded(
                            child: TextField(
                              controller: phoneController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10),
                              ],
                              onChanged: (value) => cubit.setPhone(value),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "رقم الهاتف",
                                counterText: '',
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
                    onPressed: () async {
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
                          provider.phone=fullNumber;

                            print("-------------------/n");
                            print('User UID: ${provider}');


                      // await PhoneMode().updateUserPhone(fullNumber);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => VerifyCode(provider: provider,phoneNumber: fullNumber),
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
