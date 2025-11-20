import 'package:fixit/l10n/app_localizations.dart';
import 'package:fixit/gitHub/presentation/screens/account_service/Location/LocationAccess/location_acssess_view.dart';
import 'package:fixit/gitHub/presentation/screens/account_service/Phone%20number/verify%20code/verify_code_cubit.dart';
import 'package:fixit/gitHub/presentation/widgets/custombutton.dart';
import 'package:fixit/userModel/service_provider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyCode extends StatelessWidget {
   final ServiceProviderModel provider;
   VerifyCode({super.key, required String phoneNumber, required this.provider});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    final controllers = List.generate(5, (_) => TextEditingController());
    final focusNodes = List.generate(5, (_) => FocusNode());

    return BlocProvider(
      create: (_) => VerifyCodeCubit(),
      child: BlocListener<VerifyCodeCubit, VerifyCodeState>(
        listener: (context, state) {},
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
                  'assets/images/verifyfram.png',
                  width: screenWidth * 3,
                ),
              ),
            ),
          ),
          body: BlocBuilder<VerifyCodeCubit, VerifyCodeState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.04,
                      left: screenWidth * 0.06,
                      right: screenWidth * 0.06,
                      bottom: screenHeight * 0.06,
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.enterPinTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xff565656),
                        fontSize: screenWidth * 0.045,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.07,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.06,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        textDirection: TextDirection.ltr,
                        children: List.generate(
                          5,
                          (index) => _digitField(
                            context,
                            index,
                            controllers,
                            focusNodes,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.07),
                  buttonItem(
                    context,
                    text: state.isLoading
                        ? "Loading..."
                        : AppLocalizations.of(context)!.verifyButton,
                    onPressed: state.isLoading
                        ? null
                        : () {
                            context.read<VerifyCodeCubit>().verifyCode(
                              onError: () {
                                // امسح الأرقام بعد الخطأ
                                for (final c in controllers) {
                                  c.clear();
                                }
                                FocusScope.of(context).unfocus();
                              },
                              onSuccess: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => LocationAccessUI(provider: provider),
                                  ),
                                );
                              },
                              showError: (msg) {
                                ScaffoldMessenger.of(
                                  context,
                                ).showSnackBar(SnackBar(content: Text(msg)));
                              },
                            );
                          },
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.didNotReceiveCode,
                        style: TextStyle(color: const Color(0xff565656)),
                      ),
                      const SizedBox(width: 5),
                      TextButton(
                        onPressed: state.resendCountdown == 0
                            ? () => context.read<VerifyCodeCubit>().resendCode()
                            : null,
                        child: Text(
                          state.resendCountdown == 0
                              ? AppLocalizations.of(context)!.sendAgain
                              : "أعد الإرسال بعد ${state.resendCountdown}s",
                          style: const TextStyle(color: Color(0xff0054A5)),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _digitField(
    BuildContext context,
    int index,
    List<TextEditingController> controllers,
    List<FocusNode> focusNodes,
  ) {
    return SizedBox(
      width: 50,
      child: TextField(
        controller: controllers[index],
        focusNode: focusNodes[index],
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        onChanged: (value) {
          context.read<VerifyCodeCubit>().updateDigit(index, value);
          if (value.isNotEmpty && index < controllers.length - 1) {
            FocusScope.of(context).requestFocus(focusNodes[index + 1]);
          }
        },
        onEditingComplete: () {
          if (controllers[index].text.isEmpty && index > 0) {
            FocusScope.of(context).requestFocus(focusNodes[index - 1]);
          }
        },
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Color(0xff0054A5)),
          ),
        ),
      ),
    );
  }
}
