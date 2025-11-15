import 'package:fixit/presentation/screens/order_booking/widget/cards/shard_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fixit/presentation/screens/order_booking/order/cubit/orders_cubit.dart';
import 'package:fixit/presentation/screens/order_booking/models/order_model.dart';
import 'package:fixit/l10n/app_localizations.dart';

class ScheduleOrderCard extends StatelessWidget {
  final OrderModel order;

  const ScheduleOrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final w = MediaQuery.of(context).size.width;
    final cubit = context.read<OrdersCubit>();

    return baseCard(
      context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(context, order.serviceName),

          SizedBox(height: w * 0.03),
          const Divider(color: Color(0xffE0E0E0)),
          SizedBox(height: w * 0.03),

          infoRow(
            context,
            t.amountToPay,
            "${order.amount}/${t.perHour}",

            valueColor: const Color(0xff0054A5),
          ),
          infoRow(
            context,
            t.bookingDate,
            formatDate(context, order.bookingDate),
          ),
          infoRow(context, t.arrivalTime, order.arrivalTime ?? ""),
          infoRow(
            context,
            t.providerName,
            order.plumberName,
            link: true,
            valueColor: const Color(0xff0054A5),
          ),

          SizedBox(height: w * 0.03),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => cubit.cancelOrder(order),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xff0054A5), width: 1.2),
              ),
              child: Text(
                t.cancelBooking,
                style: const TextStyle(
                  color: Color(0xff0054A5),
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
