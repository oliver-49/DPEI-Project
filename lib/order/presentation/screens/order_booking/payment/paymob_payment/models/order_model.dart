// order model
import 'dart:convert';


class OrderModel {
  late int id;
  late int userId;
  double? orderAmount;
  String? orderStatus;

  String? paymentMethod;

  String? paymentStatus;
  double? totalTaxAmount;
  String? orderNote;
  String? createdAt;
  String? updatedAt;
  double? deliveryCharge;
  String? scheduleAt;
  String? otp;
  String? pending;
  String? accepted;
  String? confirmed;
  String? processing;
  String? handover;
  String? pickedUp;
  String? delivered;
  String? canceled;
  String? refundRequested;
  String? refunded;
  int? scheduled;
  String? failed;
  int? detailsCount;


  OrderModel(
      { required this.id,
        required this.userId,
         this.orderAmount,
         this.paymentMethod,
         this.paymentStatus,
         this.orderNote,
         this.createdAt,
         this.updatedAt,
         this.deliveryCharge,
         this.scheduleAt,
         this.otp,
         this.orderStatus,
         this.pending,
         this.accepted,
         this.confirmed,
         this.processing,
         this.handover,
         this.pickedUp,
         this.delivered,
         this.canceled,
         this.scheduled,
         this.failed,
         this.detailsCount,
      });

  @override
String toString() {
  return 'OrderModel(id: $id, userId: $userId, amount: $orderAmount, status: $orderStatus, paymentStatus: $paymentStatus)';
}

}