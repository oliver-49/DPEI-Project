import 'package:fixit/order/presentation/screens/order_booking/order/cubit/orders_state.dart';

class OrderModel {
  final String id;
  final String serviceName;
  final double amount;
  final String plumberName;
  final DateTime bookingDate;
  final String? arrivalTime;
  final OrderTab status;

  const OrderModel({
    required this.id,
    required this.serviceName,
    required this.amount,
    required this.plumberName,
    required this.bookingDate,
    required this.status,
    this.arrivalTime,
  });
}
