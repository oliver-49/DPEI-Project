import 'package:dpei_project/l10n/app_localizations.dart';
import 'package:dpei_project/presentation/screens/account_service/acount_details/acount_details_cubit.dart';
import 'package:dpei_project/presentation/screens/account_service/acount_details/acount_details_state.dart';
import 'package:dpei_project/presentation/widgets/custombutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AcountDetails extends StatelessWidget {
  const AcountDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return BlocProvider(
      create: (context) => AccountDetailsCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Image(
                image: AssetImage('assets/images/account details.png'),
              ),
            ),
          ),
        ),
        body: BlocConsumer<AccountDetailsCubit, AccountDetailsState>(
          listener: (context, state) {
            if (state is AccountDetailsError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          builder: (context, state) {
            final cubit = context.read<AccountDetailsCubit>();
            final t = AppLocalizations.of(context)!;

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.04,
                  horizontal: screenWidth * 0.06,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.addAccountDetails,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff565656),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),

                    _buildInputField(
                      context,
                      hintText: t.ownerName,
                      initialValue: state.ownerName,
                      onChanged: (value) => cubit.updateField(ownerName: value),
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    _buildInputField(
                      context,
                      hintText: t.nicNumber,
                      initialValue: state.nicNumber,
                      keyboardType: TextInputType.number,
                      onChanged: (value) => cubit.updateField(nicNumber: value),
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    _buildInputField(
                      context,
                      hintText: t.phoneNumber,
                      initialValue: state.phoneNumber,
                      keyboardType: TextInputType.phone,
                      onChanged: (value) =>
                          cubit.updateField(phoneNumber: value),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Text(
                      t.nicExpiryDate,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff565656),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),

                    _buildInputField(
                      context,
                      hintText: t.dateFormat,
                      initialValue: state.nicExpiryDate,
                      keyboardType: TextInputType.datetime,
                      onChanged: (value) =>
                          cubit.updateField(nicExpiryDate: value),
                    ),

                    SizedBox(height: screenHeight * 0.1),

                    buttonItem(
                      context,
                      text: t.next,
                      onPressed: state.isFormValid
                          ? () {
                              cubit.submitDetails();
                              _showConfirmationDialog(
                                context,
                                screenWidth,
                                screenHeight,
                              );
                            }
                          : null,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildInputField(
    BuildContext context, {
    String? hintText,
    TextInputType keyboardType = TextInputType.text,
    required String initialValue,
    required Function(String) onChanged,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      keyboardType: keyboardType,
      style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.black),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          // ignore: deprecated_member_use
          color: const Color(0xff565656).withOpacity(0.6),
          fontSize: screenWidth * 0.04,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenHeight * 0.015,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(color: Color(0xffE0E0E0), width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(color: Color(0xffE0E0E0), width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(color: Color(0xff0054A5), width: 1.5),
        ),
      ),
    );
  }
}

void _showConfirmationDialog(
  BuildContext context,
  double screenWidth,
  double screenHeight,
) {
  final t = AppLocalizations.of(context)!;

  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return Directionality(
        textDirection: Directionality.of(context),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Material(
              child: Container(
                decoration: const BoxDecoration(color: Color(0xffFFFFFF)),
                padding: const EdgeInsets.symmetric(
                  vertical: 17,
                  horizontal: 10,
                ),
                height: screenHeight * .407,
                width: screenWidth * .8,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: screenHeight * .080,
                        child: const Icon(
                          Icons.check_circle,
                          size: 60,
                          color: CupertinoColors.activeBlue,
                        ),
                      ),
                      SizedBox(height: screenHeight * .020),

                      Text(
                        t.applicationReceived,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          color: Color(0xff565656),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: screenHeight * .010),

                      // الرسالة المترجمة العامة
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          t.applicationReceivedMessage,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 14,
                            color: Color(0xff565656),
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * .040),

                      buttonItem(
                        context,
                        text: t.home,
                        onPressed: () {
                          Navigator.pop(dialogContext);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
