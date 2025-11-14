
import 'package:fixit/gitHub/account_setup_service_seeker/view/code_sent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../l10n/app_localizations.dart';
import '../../booking_services/view/const.dart';
import '../../booking_services/widgets/custom_textfield.dart';
import '../../booking_services/widgets/custom_button.dart';
import '../cubit/email_cubit.dart';
import '../cubit/email_state.dart';

class Emailaddress extends StatelessWidget {
  Emailaddress({super.key});

  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var lang=AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => EmailCubit(),
      child: BlocListener<EmailCubit, EmailState>(
        listener: (context, state) {
          if (state is EmailSuccess) {
            Get.snackbar(lang.success, lang.codeSendsSuccessfully,
                backgroundColor: Colors.green,
                colorText: Colors.white);
            Get.to(CodeSent());
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child:Icon(Icons.arrow_back, color: Color(0xff2B54A4)),
            ),
            title:
            Image.asset(imagepath + "Frame (2).png", width: screenWidth * 0.100),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * .04),
                   Text(
                    lang.enterEmail,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff565656),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: screenHeight * .04),
                  customTextfield(
                    label: lang.email,
                    prefixIcon: Icon(Icons.email_rounded),
                    controller: controller,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return lang.pleaseEnterYourEmail;
                      } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$")
                          .hasMatch(val)) {
                        return lang.enterValidEmailAddress;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * .08),
                  BlocBuilder<EmailCubit, EmailState>(
                    builder: (context, state) {
                      if (state is EmailLoading) {
                        return  Center(child: CircularProgressIndicator());
                      }
                      return customButton(
                        title: lang.sendCode,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            context
                                .read<EmailCubit>()
                                .sendCode(controller.text.trim());
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
