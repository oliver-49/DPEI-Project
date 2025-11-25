import 'package:fixit/order/presentation/screens/order_booking/widget/cards/paid_card.dart';
import 'package:fixit/order/presentation/screens/order_booking/widget/cards/schedule_card.dart';
import 'package:fixit/order/presentation/screens/order_booking/widget/cards/unpaid_card.dart';
import 'package:flutter/material.dart';
import 'package:fixit/order/presentation/screens/order_booking/models/order_model.dart';
import 'package:fixit/order/presentation/screens/order_booking/order/cubit/orders_state.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    switch (order.status) {
      case OrderTab.unpaid:
        return UnpaidOrderCard(order: order);

      case OrderTab.paid:
        return PaidOrderCard(order: order);

      case OrderTab.schedule:
        return ScheduleOrderCard(order: order);
    }
  }
}
