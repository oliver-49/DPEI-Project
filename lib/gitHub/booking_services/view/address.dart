import 'package:fixit/gitHub/booking_services/cubit/booking_cubit.dart';
import 'package:fixit/gitHub/booking_services/cubit/booking_state.dart';
import 'package:fixit/gitHub/booking_services/model/Address_model.dart';
import 'package:fixit/gitHub/booking_services/view/date.dart';
import 'package:fixit/gitHub/booking_services/widgets/custom_button.dart';
import 'package:fixit/gitHub/booking_services/widgets/custom_textfield.dart';
import 'package:fixit/ye/utalities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../l10n/app_localizations.dart';

class Address extends StatelessWidget {
  Address({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var lang=AppLocalizations.of(context)!;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    TextEditingController _home = TextEditingController();
    TextEditingController _street = TextEditingController();
    TextEditingController _fullAddress = TextEditingController();

    return Form(
      key: formKey,
      child: BlocListener<BookingCubit, BookingState>(
        listener: (context, state) {
          if (state is AddressSucsuessState) {
            Get.snackbar(
              lang.success,
              lang.locationIsAdded,
              backgroundColor: Colors.green,
            );
            Get.to(Date());
          }
          if (state is AddressErrorState) {
            Get.snackbar(
              lang.error,
              lang.pleaseEnterVaildData,
              backgroundColor: Colors.red,
            );
          }
        },
        child: Scaffold(
      backgroundColor: AppColors.bgColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * .040),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Color(0xff2B54A4),
                          ),
                        ),
                        SizedBox(width: screenWidth * .020),
                        Text(
                          lang.bookPlumber,
                          style: TextStyle(
                            color: Color(0xff2B54A4),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * .056),

                    Text(
                      lang.enterYourLocation,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: screenHeight * .030),
                    customTextfield(
                      controller: _home,
                      label: lang.houseNumber,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return (lang.pleaseEnterVaildData);
                        }
                        return null;
                      }, prefixIcon: null,
                    ),
                    SizedBox(height: screenHeight * .025),
                    customTextfield(
                      controller: _street,
                      label: lang.streetNumber,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return (lang.pleaseEnterVaildData);
                        }
                        return null;
                      }, prefixIcon: null,
                    ),
                    SizedBox(height: screenHeight * .025),
                    customTextfield(
                      controller: _fullAddress,
                      label: lang.fullLocation,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return (lang.pleaseEnterVaildData);
                        }
                        return null;
                      }, prefixIcon: null,
                    ),
                    SizedBox(height: screenHeight * .250),
                    BlocBuilder<BookingCubit, BookingState>(
                      builder: (context, state) {
                        final cubit = context.read<BookingCubit>();
                        return customButton(
                          title: lang.next,
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              cubit.setAddress(_fullAddress.text);
                              cubit.setHome(_home.text);
                              cubit.setStreet(_street.text);
                              cubit.addressChange(
                                AddressModel(
                                  _home.text,
                                  _street.text,
                                  _fullAddress.text,
                                ),
                              );
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
      ),
    );
  }
}
