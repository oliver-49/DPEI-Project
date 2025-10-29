// phonenumber_responsive.dart
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dpei_project/presentation/screens/account_service/Phone%20number/border_cubit.dart';
import 'package:dpei_project/presentation/screens/account_service/Phone%20number/verify.dart';
import 'package:dpei_project/presentation/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Phonnumber extends StatelessWidget {
  const Phonnumber({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return BlocProvider(
      create: (_) => BorderCubit(),
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
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.01,
              ),
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
                  "Enter your Phone number to verify",
                  style: TextStyle(
                    color: const Color(0xff565656),
                    fontSize: screenWidth * 0.045,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              BlocBuilder<BorderCubit, Color>(
                builder: (context, borderColor) {
                  return InkWell(
                    onTap: () {
                      context.read<BorderCubit>().changeBorder(const Color(0xff0054A5));
                    },
                    child: Container(
                      height: screenHeight * 0.07,
                      width: screenWidth * 0.85,
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: borderColor, width: 1),
                      ),
                      child: Row(
                        children: [
                          CountryCodePicker(
                            onChanged: (code) {
                              // print(code.dialCode);
                            },
                            initialSelection: 'EG',
                            favorite: const ['+20', 'EG'],
                            showCountryOnly: true,
                            showOnlyCountryWhenClosed: false,
                            alignLeft: false,
                          ),
                          const Expanded(
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "10380480244",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
        
              SizedBox(height: screenHeight * 0.1),
              buttonItem(context, text: 'Send Code', onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VerifyCode()),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}