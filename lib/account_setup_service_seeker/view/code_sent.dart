
import 'package:fixit/account_setup_service_seeker/view/create_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../l10n/app_localizations.dart';
import '../../booking_services/view/const.dart';
import '../../booking_services/widgets/custom_button.dart';
import '../cubit/code_cubit.dart';
import '../cubit/code_state.dart';

class CodeSent extends StatelessWidget {
  CodeSent({super.key});

  String otpCode = "";

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var lang=AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => VerifyCubit(),
      child: BlocListener<VerifyCubit, VerifyState>(
        listener: (context, state) {
           if (state is VerifyError) {
          Get.snackbar(lang.error, state.message,
          backgroundColor: Colors.red,
          colorText: Colors.white,);
          }
           else if (state is VerifySuccess) {
            Get.snackbar(lang.success, lang.theCodeIsCorrect,
            backgroundColor: Colors.green,
          colorText: Colors.white,);
             Get.to(CreatePassword());
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: GestureDetector(
              onTap: () => Get.back(),
              child:  Icon(Icons.arrow_back, color: Color(0xff2B54A4)),
            ),
            title: Image.asset(imagepath + "Frame (2).png", width: screenWidth * 0.100),
          ),
          body: Padding(
            padding:EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * .04),
                 Text(
                  lang.enter5digit,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff565656),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: screenHeight * .04),
                OtpTextField(
                  numberOfFields: 5,
                  borderColor: Colors.blue,
                  showFieldAsBox: true,
                  onSubmit: (String code) {
                    otpCode = code;
                  },
                ),
                SizedBox(height: screenHeight * .08),
                BlocBuilder<VerifyCubit, VerifyState>(
                  builder: (context, state) {
                    if (state is VerifyLoading) {
                      return  Center(child: CircularProgressIndicator());
                    }
                    return customButton(
                      title:lang.verify,
                      onTap: () {
                        context.read<VerifyCubit>().verifyCode(otpCode);
                      },
                    );
                  },
                ),
                SizedBox(height: screenHeight * .03),
                Row(
                  children: [
                    Container(
                      height: screenHeight * .035,
                      width: screenWidth * .08,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:Center(child: Text("60")),
                    ),
                    SizedBox(width: screenWidth * .03),
                    Text(lang.didNotReceiveCode, style: TextStyle(fontSize: 16)),
                    Text(
                     lang.sendAgain,
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
