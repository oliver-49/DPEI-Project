import 'package:fixit/gitHub/widgets/custom_password.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../l10n/app_localizations.dart';
import '../../booking_services/view/const.dart';
import '../../booking_services/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../cubit/password_cubit.dart';
import '../cubit/passowrd_state.dart';

class CreatePassword extends StatelessWidget {
  const CreatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    var lang =AppLocalizations.of(context)!;

    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();

    return BlocProvider(
      create: (context) => CreatePasswordCubit(),
      child: BlocConsumer<CreatePasswordCubit, CreatePasswordState>(
        listener: (context, state) {
          if (state is CreatePasswordError) {
            Get.snackbar(lang.error, state.message,
                backgroundColor: Colors.red, colorText: Colors.white);
          } else if (state is CreatePasswordSuccess) {
            Get.snackbar(lang.success, lang.passwordUpdatedSuccessfully,
                backgroundColor: Colors.green, colorText: Colors.white);
            Get.back();
          }
        },
        builder: (context, state) {
          var cubit = context.read<CreatePasswordCubit>();
          var screenWidth = MediaQuery.of(context).size.width;
          var screenHeight = MediaQuery.of(context).size.height;

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              leading: GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(Icons.arrow_back, color: Color(0xff2B54A4)),
              ),
              title: Image.asset(imagepath + "Frame (2).png",
                  width: screenWidth * 0.100),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * .04),
                  Text(
                    lang.createPassword,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff565656),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: screenHeight * .04),
                  CustomPassword(controller: controller1, hintText: lang.newPassword),
                  SizedBox(height: screenHeight * .04),
                  CustomPassword(controller: controller2, hintText:lang.confirmPassword),
                  SizedBox(height: screenHeight * .04),
                  state is CreatePasswordLoading
                      ? const Center(child: CircularProgressIndicator())
                      : customButton(
                    title: lang.save,
                    onTap: () => cubit.savePassword(
                        controller1.text, controller2.text),
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
