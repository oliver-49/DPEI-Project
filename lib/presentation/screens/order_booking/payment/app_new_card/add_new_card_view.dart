import 'package:fixit/core/stores/app_box.dart';
import 'package:fixit/presentation/screens/order_booking/payment/app_new_card/add_new_card_cubit.dart';
import 'package:fixit/presentation/screens/order_booking/payment/app_new_card/add_new_card_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fixit/l10n/app_localizations.dart';
import 'package:fixit/presentation/widgets/custombutton.dart';

class AddNewCardView extends StatelessWidget {
  const AddNewCardView({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    final cardTypes = ["Credit card", "Debit card"];

    return BlocProvider(
      create: (_) => AddNewCardCubit(),
      child: BlocBuilder<AddNewCardCubit, AddNewCardState>(
        builder: (context, state) {
          final cubit = context.read<AddNewCardCubit>();

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Color(0xff0054A5)),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                t.addNewCard,
                style: const TextStyle(
                  color: Color(0xff0054A5),
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
            ),

            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: h * 0.015),

                  Text(
                    t.selectPaymentMethod,
                    style: TextStyle(
                      fontSize: w * 0.04,
                      color: const Color(0xff565656),
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: h * 0.02),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: w * 0.04,
                      vertical: w * 0.02,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xffE0E0E0)),
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: state.selectedCardType,
                      underline: const SizedBox(),
                      hint: Text(
                        t.selectPaymentMethod,
                        style: const TextStyle(
                          color: Color(0xffA5A5A5),
                          fontFamily: 'Poppins',
                        ),
                      ),
                      items: cardTypes
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                      onChanged: (v) => cubit.changeCardType(v!),
                    ),
                  ),

                  SizedBox(height: h * 0.03),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: cubit.setCardNumber,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(16),
                    ],
                    decoration: InputDecoration(
                      labelText: t.cardNumber,
                      hintText: "0000 0000 0000 0000",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xffE0E0E0)),
                      ),
                    ),
                  ),

                  SizedBox(height: h * 0.02),

                  TextFormField(
                    onChanged: cubit.setHolderName,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z\s]+")),
                    ],
                    decoration: InputDecoration(
                      labelText: t.cardHolderName,
                      hintText: t.cardHolderName,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xffE0E0E0)),
                      ),
                    ),
                  ),

                  SizedBox(height: h * 0.02),

                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            final now = DateTime.now();
                            final selectedDate = await showDatePicker(
                              context: context,
                              initialDate: now,
                              firstDate: DateTime(now.year, now.month),
                              lastDate: DateTime(now.year + 15),
                            );

                            if (selectedDate != null) {
                              final month = selectedDate.month
                                  .toString()
                                  .padLeft(2, '0');
                              final year = (selectedDate.year % 100)
                                  .toString()
                                  .padLeft(2, '0');
                              cubit.setExpiryDate("$month/$year");
                            }
                          },
                          child: AbsorbPointer(
                            child: TextFormField(
                              controller: TextEditingController(
                                text: state.expiryDate,
                              ),
                              decoration: InputDecoration(
                                labelText: t.cardExpiryDate,
                                hintText: "MM/YY",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Color(0xffE0E0E0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: w * 0.04),

                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          onChanged: cubit.setCvv,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                          ],
                          decoration: InputDecoration(
                            labelText: t.cvv,
                            hintText: "***",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xffE0E0E0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  buttonItem(
                    context,
                    text: t.continueBtn,
                    onPressed: () {
                      if (state.selectedCardType == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(t.selectPaymentMethod)),
                        );
                        return;
                      }

                      if (state.cardNumber.length < 16) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(t.enterValidCardNumber)),
                        );
                        return;
                      }

                      if (state.expiryDate.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(t.enterExpiryDate)),
                        );
                        return;
                      }

                      if (state.cvv.length < 3 || state.cvv.length > 4) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(t.enterValidCvv)),
                        );
                        return;
                      }

                      final last4 = state.cardNumber.substring(12, 16);

                      AppBox.cardsBox.add({
                        "type": state.selectedCardType,
                        "number": state.cardNumber,
                        "last4": last4,
                        "expiry": state.expiryDate,
                        "name": state.holderName,
                      });

                      Navigator.pop(context, true);
                    },
                  ),

                  SizedBox(height: h * 0.03),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
