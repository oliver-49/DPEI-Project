import 'package:fixit/presentation/screens/order_booking/widget/cards/shard_widgets.dart';
import 'package:flutter/material.dart';
import 'package:fixit/presentation/screens/order_booking/models/order_model.dart';
import 'package:fixit/l10n/app_localizations.dart';
import 'package:fixit/presentation/widgets/custombutton.dart';
import 'package:fixit/presentation/screens/order_booking/payment/select_payment/payment_view.dart';

class UnpaidOrderCard extends StatelessWidget {
  final OrderModel order;

  const UnpaidOrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final w = MediaQuery.of(context).size.width;

    return baseCard(
      context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(context, order.serviceName),

          SizedBox(height: w * 0.03),
          const Divider(color: Color(0xffE0E0E0)),
          SizedBox(height: w * 0.03),

          infoRow(context, t.amountToPay, "${order.amount} ${t.egp}"),
          infoRow(
            context,
            t.bookingDate,
            formatDate(context, order.bookingDate),
          ),
          infoRow(
            context,
            t.providerName,
            order.plumberName,
            link: true,
            valueColor: const Color(0xff0054A5),
          ),

          SizedBox(height: w * 0.03),

          buttonItem(
            context,
            text: t.payNow,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PaymentView()),
              );
            },
          ),
        ],
      ),
    );
  }
}
