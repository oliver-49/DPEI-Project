// payment manager
import 'dart:convert';
//import 'package:fixit/order/presentation/screens/order_booking/payment/paymob_payment/constants/constants.dart';
import 'package:get/get.dart';

class PaymobManager extends GetConnect {
  Future<String> getPaymentKey(double amount, String currency) async {
    try {
      String authenticationToken = await _getAuthenticationToken();

      int orderId = await _getOrderId(
        authToken: authenticationToken,
        amountCents: (amount * 100).toString(),
        currency: currency,
      );

      String paymentKey = await _getPaymentKey(
        authToken: authenticationToken,
        amountCents: (amount * 100).toString(),
        currency: currency,
        orderId: orderId.toString(),
      );

      return paymentKey;
    } catch (e) {
      print("Error in PaymobManager: $e");
      throw Exception("Failed to get payment key");
    }
  }

  // Future<String> _getAuthenticationToken() async {
  //   final response = await post(
  //     "https://accept.paymob.com/api/auth/tokens",
  //     {"api_key": KConstants.apiKey},
  //     headers: {"Content-Type": "application/json"},
  //   );

  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     return response.body["token"];
  //   } else {
  //     throw Exception("Failed to get auth token: ${response.statusCode}");
  //   }
  // }

  Future<String> _getAuthenticationToken() async {
    final response = await post(
      "https://accept.paymob.com/api/auth/tokens",
      jsonEncode({"api_key": KConstants.apiKey}), // أهم خطوة
      headers: {"Content-Type": "application/json"},
    );

    print("Status Code: ${response.statusCode}");
    print("Response: ${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body["token"];
    } else {
      throw Exception("Failed to get auth token: ${response.statusCode}");
    }
  }

  Future<int> _getOrderId({
    required String authToken,
    required String amountCents,
    required String currency,
  }) async {
    final response = await post(
      "https://accept.paymob.com/api/ecommerce/orders",
      {
        "auth_token": authToken,
        "amount_cents": amountCents,
        "currency": currency,
        "delivery_needed": "false",
        "items": [],
      },
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body["id"];
    } else {
      throw Exception("Failed to create order: ${response.statusCode}");
    }
  }

  Future<String> _getPaymentKey({
    required String authToken,
    required String orderId,
    required String amountCents,
    required String currency,
  }) async {
    final response = await post(
      "https://accept.paymob.com/api/acceptance/payment_keys",
      {
        "expiration": 3600,
        "auth_token": authToken,
        "order_id": orderId,
        // "integration_id": KConstants.cardPaymentMethodIntegrationId,
        "amount_cents": amountCents,
        "currency": currency,
        "billing_data": {
          "first_name": "Clifford",
          "last_name": "Nicolas",
          "email": "claudette09@exa.com",
          "phone_number": "+86(8)9135210487",
          "apartment": "NA",
          "floor": "NA",
          "street": "NA",
          "building": "NA",
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "state": "NA",
        },
      },
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body["token"];
    } else {
      throw Exception("Failed to get payment key: ${response.statusCode}");
    }
  }
}
