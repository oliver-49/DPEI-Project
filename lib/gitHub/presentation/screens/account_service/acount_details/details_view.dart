
// import 'package:fixit/firebase/account_details.dart';
// import 'package:fixit/firebase/done_setup.dart';
import 'package:fixit/firebase/getORadd_allData_user.dart';
import 'package:fixit/gitHub/core/stores/app_box.dart';
import 'package:fixit/gitHub/presentation/homescreen.dart';
import 'package:fixit/gitHub/presentation/widgets/custombutton.dart';
import 'package:fixit/l10n/app_localizations.dart';
import 'package:fixit/userModel/service_provider_model.dart';
import 'package:fixit/ye/Main_Home/navigation_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../ye/Main_Home/home_screen.dart';
import 'acount_details_cubit.dart';
import 'acount_details_state.dart';

class AcountDetails extends StatelessWidget {
  
  final ServiceProviderModel provider;
    AcountDetails({super.key, required this.provider});

  String _formatDate(DateTime? d) {
    if (d == null) return '';
    final y = d.year.toString().padLeft(4, '0');
    final m = d.month.toString().padLeft(2, '0');
    final dd = d.day.toString().padLeft(2, '0');
    return '$y-$m-$dd';
  }

  Future<void> _pickExpiryDate(
    BuildContext context,
    AccountDetailsCubit cubit,
    DateTime? current,
  ) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      
      context: context,
      initialDate: current ?? now,
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: DateTime(now.year + 15),
      builder: (ctx, child) {
        return child!;
      },
    );
    if (picked != null) {
      cubit.updateField(nicExpiryDate: picked);
    }
  }

bool l=false;
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Image(
                image: const AssetImage('assets/images/account details.png'),
                width: screenWidth * 3,
              ),
            ),
          ),
        ),
        body: BlocConsumer<AccountDetailsCubit, AccountDetailsState>(
          listener: (context, state) {
            if (state.error != null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error!)));
            }
          },
          builder: (context, state) {
            final cubit = context.read<AccountDetailsCubit>();
            final t = AppLocalizations.of(context)!;

            final expiryController = TextEditingController(
              text: _formatDate(state.nicExpiryDate),
            );

             // ✅ Validation Messages
            String? nameError;
            String? nicError;
            // String? phoneError;

            if (state.ownerName.trim().isNotEmpty && state.ownerName.trim().length<8) {
              nameError = 'الاسم كامل مطلوب';
            }
            if ( state.nicNumber.length<13 && state.nicNumber.isNotEmpty && !RegExp(r'^\d{14}$').hasMatch(state.nicNumber)) {
              nicError = 'الرقم القومي يجب أن يحتوي على 14 رقم';
            }
            // if (state.phoneNumber.isNotEmpty &&
            //     !RegExp(r'^(010|011|012|015)\d{8}$').hasMatch(state.phoneNumber)) {
            //   phoneError = 'رقم الهاتف يجب أن يبدأ بـ 01 و يكون 11 رقم ';
            // }
            
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

                    _buildTextField(
                      context,
                      hintText: t.ownerName,
                      initialValue: state.ownerName,
                      onChanged: (v) => cubit.updateField(ownerName: v),
                      errorText: nameError,
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    _buildTextField(
                      context,
                      hintText: t.nicNumber,
                      initialValue: state.nicNumber,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(14),
                      ],
                      onChanged: (v) => cubit.updateField(nicNumber: v),
                      errorText: nicError,
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    // _buildTextField(
                    //   context,
                    //   hintText: t.phoneNumber,
                    //   initialValue: state.phoneNumber,
                    //   keyboardType: TextInputType.phone,
                    //   inputFormatters: [
                    //     FilteringTextInputFormatter.digitsOnly,
                    //     LengthLimitingTextInputFormatter(11),
                    //   ],
                    //   onChanged: (v) => cubit.updateField(phoneNumber: v),
                    //   errorText: phoneError,
                    // ),
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
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        
                        controller: expiryController,
                        readOnly: true,
                        showCursor: false,
                        onTap: () => _pickExpiryDate(
                          context,
                          cubit,
                          state.nicExpiryDate,
                        ),
                        decoration: InputDecoration(
                          hintText: t.dateFormat,
                          filled: true,
                          fillColor: Colors.white, 
                          hintStyle: TextStyle(
                            // ignore: deprecated_member_use
                            color: const Color(0xff565656).withOpacity(0.6),
                            fontSize: screenWidth * 0.04,
                          ),
                          suffixIcon: const Icon(Icons.date_range),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.04,
                            vertical: screenHeight * 0.015,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: const BorderSide(
                              color: Color(0xffE0E0E0),
                              width: 1.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: const BorderSide(
                              color: Color(0xffE0E0E0),
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: const BorderSide(
                              color: Color(0xff0054A5),
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.1),

                    buttonItem(
                      context,
                      text: t.next,
                      onPressed: state.isFormValid
                          ? () async{
                              FocusScope.of(context).unfocus();
                              cubit.submitDetails();
                              // await AccountDetailsData().setUserAccountDetailsData(
                              //   ownerName: cubit.state.ownerName,
                              //   nicNumber:  cubit.state.nicNumber,
                                
                               

                              // );
                                provider.nicNumber= cubit.state.nicNumber;
                                provider.ownerName= cubit.state.ownerName;
                              showDialog(
                                context: context,
                                builder: (BuildContext dialogContext) {
                                  final t = AppLocalizations.of(context)!;
                                  return Directionality(
                                    textDirection: Directionality.of(context),
                                    child: Center(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Material(
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: Color(0xffFFFFFF),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 17,
                                              horizontal: 10,
                                            ),
                                            height: screenHeight * .407,
                                            width: screenWidth * .8,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: screenHeight * .080,
                                                    child: const Icon(
                                                      Icons.check_circle,
                                                      size: 60,
                                                      color: CupertinoColors
                                                          .activeBlue,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: screenHeight * .020,
                                                  ),
                                                  Text(
                                                    t.applicationReceived,
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontSize: 18,
                                                      fontFamily: 'Poppins',
                                                      color: Color(0xff565656),
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: screenHeight * .010,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 30,
                                                        ),
                                                    child: Text(
                                                      t.applicationReceivedMessage,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontSize: 14,
                                                        color: Color(
                                                          0xff565656,
                                                        ),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'Poppins',
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: screenHeight * .040,
                                                  ),
                                                  buttonItem(
                                                    context,
                                                    text: t.home,
                                                    loading: l,
                                                    onPressed: () async {
                                                    l=true;
                                                    // await DoneSetup().setDone() ;
                                                      provider.allSetup= true;
                                                    final service = ServiceProviderService();
                                                    provider.createdAt=DateTime.now();
                                                      await service.addServiceProvider(provider);
                                                      Navigator.pop(
                                                        dialogContext,
                                                      );
                                                      await AppBox.setSetupDone(
                                                        true,
                                                      );
                                                      l=false;
                                                      Navigator.pushAndRemoveUntil(
                                                        // ignore: use_build_context_synchronously
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (_) =>
                                                                NavigationPage(provider:provider),
                                                        ),
                                                        (route) => false,
                                                      );
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

  Widget _buildTextField(
    BuildContext context, {
    required String initialValue,
    required Function(String) onChanged,
    String? hintText,
    String? errorText, 
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      autovalidateMode: AutovalidateMode.always,
      style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.black),
      decoration: InputDecoration(
        hintText: hintText,
        errorText: errorText, 
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
