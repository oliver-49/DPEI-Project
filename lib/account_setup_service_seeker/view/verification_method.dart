import 'package:fixit/account_setup_service_seeker/view/emailaddress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../booking_services/widgets/custom_button.dart';
import '../../booking_services/widgets/custom_select.dart';

import 'package:fixit/booking_services/view/const.dart';

import '../cubit/verification_cubit.dart';
import '../cubit/verification_state.dart';

class PhoneVerificationPage extends StatelessWidget {
  const PhoneVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Phone Verification Page")));
  }
}

class VerificationMethod extends StatelessWidget {
  const VerificationMethod({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => VerificationCubit(),
      child: BlocListener<VerificationCubit, VerificationState>(
        listener: (context, state) {
          if (state is VerificationError) {
            Get.snackbar("Error", state.message, backgroundColor: Colors.red);
          } else if (state is VerificationNext) {
            if (state.method == "email") {
              Get.to(() => Emailaddress());
            } else if (state.method == "phone") {
              Get.to(() => const PhoneVerificationPage());
            }
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
              child: const Icon(Icons.arrow_back, color: Color(0xff2B54A4)),
            ),
            title: Image.asset(
              imagepath + "Frame (2).png",
              width: screenWidth * 0.100,
            ),
          ),
          body: BlocBuilder<VerificationCubit, VerificationState>(
            builder: (context, state) {
              final cubit = context.read<VerificationCubit>();
              final selected = cubit.selectedMethod;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * .04),
                    const Text(
                      "Select Verification method",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff565656),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: screenHeight * .03),

                    GestureDetector(
                      onTap: () => cubit.selectMethod("email"),
                      child: Select(
                        icon: Icons.email_rounded,
                        text: "Email",
                        isSelected: selected == "email",
                      ),
                    ),
                    SizedBox(height: screenHeight * .02),

                    GestureDetector(
                      onTap: () => cubit.selectMethod("phone"),
                      child: Select(
                        icon: Icons.call,
                        text: "Mobile Phone",
                        isSelected: selected == "phone",
                      ),
                    ),
                    SizedBox(height: screenHeight * .04),

                    customButton(title: "Next", onTap: () => cubit.goNext()),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
