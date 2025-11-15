import 'package:fixit/presentation/screens/order_booking/payment/app_new_card/add_new_card_view.dart';
import 'package:fixit/presentation/screens/order_booking/payment/payment_success_dialog.dart';
import 'package:fixit/presentation/screens/order_booking/payment/select_payment/payment_cubit.dart';
import 'package:fixit/presentation/screens/order_booking/payment/select_payment/payment_method_model.dart';
import 'package:fixit/presentation/screens/order_booking/payment/select_payment/payment_state.dart';
import 'package:fixit/presentation/screens/order_booking/widget/PaymentMethodTile.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fixit/l10n/app_localizations.dart';
import 'package:fixit/presentation/widgets/custombutton.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    final paymentMethods = [
      PaymentMethodModel(name: "Instapay", icon: "assets/images/instapay.png"),
      PaymentMethodModel(
        name: "Vodafone Cash",
        icon: "assets/images/vodafone-cash-logo.png",
      ),
      PaymentMethodModel(name: "Fawry", icon: "assets/images/fawry-logo.png"),
      PaymentMethodModel(name: "PayPal", icon: "assets/images/paypal.png"),
    ];

    return BlocProvider(
      create: (_) => PaymentCubit()..loadSavedCards(),
      child: BlocBuilder<PaymentCubit, PaymentState>(
        builder: (context, state) {
          final cubit = context.read<PaymentCubit>();

          final hasSelection =
              state.selectedMethodIndex != -1 || state.selectedCardIndex != -1;

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
                t.payment,
                style: const TextStyle(
                  color: Color(0xff0054A5),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: h * 0.02),

                  Text(
                    t.selectPaymentMethod,
                    style: TextStyle(
                      fontSize: w * 0.04,
                      color: const Color(0xff565656),
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: h * 0.03),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for (int i = 0; i < paymentMethods.length; i++)
                            PaymentMethodTile(
                              method: paymentMethods[i],
                              selected: state.selectedMethodIndex == i,
                              onTap: () => cubit.selectMethod(i),
                            ),

                          if (state.savedCards.isNotEmpty) ...[
                            SizedBox(height: h * 0.02),

                            for (int i = 0; i < state.savedCards.length; i++)
                              _SavedCardTile(
                                width: w,
                                card: state.savedCards[i],
                                selected: state.selectedCardIndex == i,
                                onTap: () => cubit.selectCard(i),
                              ),
                          ],

                          SizedBox(height: h * 0.02),

                          GestureDetector(
                            onTap: () async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const AddNewCardView(),
                                ),
                              );

                              ///
                              if (result == true) {
                                cubit.loadSavedCards(selectLast: true);
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                vertical: w * 0.04,
                                horizontal: w * 0.04,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color(0xff0054A5),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.add,
                                    color: Color(0xff0054A5),
                                  ),
                                  SizedBox(width: w * 0.02),
                                  Text(
                                    t.addNewCard,
                                    style: const TextStyle(
                                      color: Color(0xff0054A5),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: h * 0.03),
                        ],
                      ),
                    ),
                  ),

                  buttonItem(
                    context,
                    text: "${t.pay} \$200.00",
                    onPressed: () {
                      if (!hasSelection) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(t.selectPaymentMethod)),
                        );
                        return;
                      }

                      PaymentSuccessDialog.show(context, amount: 200.00);
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

class _SavedCardTile extends StatelessWidget {
  final Map<String, dynamic> card;
  final bool selected;
  final VoidCallback onTap;
  final double width;

  const _SavedCardTile({
    required this.card,
    required this.selected,
    required this.onTap,
    required this.width,
  });

  String _formatCardText() {
    final number = card['number']?.toString() ?? "";
    if (number.length >= 4) {
      return "•••• •••• •••• ${number.substring(number.length - 4)}";
    }
    return "•••• •••• •••• ****";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: width * 0.03),
        padding: EdgeInsets.symmetric(
          vertical: width * 0.035,
          horizontal: width * 0.04,
        ),
        decoration: BoxDecoration(
          color: selected ? const Color(0xffE4F0FF) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected ? const Color(0xff0054A5) : const Color(0xffE0E0E0),
          ),
        ),
        child: Row(
          children: [
            const Icon(Icons.credit_card, color: Color(0xff0054A5)),
            SizedBox(width: width * 0.03),
            Expanded(
              child: Text(
                _formatCardText(),
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: Color(0xff565656),
                ),
              ),
            ),
            Icon(
              Icons.check,
              size: 20,
              color: selected ? const Color(0xff0054A5) : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
