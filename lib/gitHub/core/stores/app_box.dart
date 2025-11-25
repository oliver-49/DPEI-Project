import 'package:hive_flutter/hive_flutter.dart';

class AppBox {
  static const String _appBox = 'app';
  static const String cardsBoxName = 'cardsBox';

  static const String setupDoneKey = 'setup_done';
  static const String roleKey = 'role';
  static const String phoneKey = 'phone';
  static const String deletedOrdersKey = 'deleted_orders';
  static const String selectedPaymentKey = 'selected_payment_method';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(_appBox);
    await Hive.openBox(cardsBoxName);
  }

  static Box get box => Hive.box(_appBox);
  static Box get cardsBox => Hive.box(cardsBoxName);

  static bool isSetupDone() {
    return box.get(setupDoneKey, defaultValue: false) as bool;
  }

  static Future<void> setSetupDone(bool value) async {
    await box.put(setupDoneKey, value);
  }

  static Future<void> setUserRole(String role) async {
    await box.put(roleKey, role);
  }

  static String? getUserRole() {
    return box.get(roleKey);
  }

  static Future<void> setUserPhone(String phone) async {
    await box.put(phoneKey, phone);
  }

  static String? getUserPhone() {
    return box.get(phoneKey);
  }

  static List<String> getDeletedOrders() {
    return List<String>.from(
      box.get(deletedOrdersKey, defaultValue: <String>[]),
    );
  }

  static Future<void> addDeletedOrder(String orderId) async {
    final deleted = getDeletedOrders();
    if (!deleted.contains(orderId)) {
      deleted.add(orderId);
      await box.put(deletedOrdersKey, deleted);
    }
  }

  static Future<void> clearDeletedOrders() async {
    await box.put(deletedOrdersKey, <String>[]);
  }

  static int getSelectedPaymentMethod() {
    return box.get(selectedPaymentKey, defaultValue: -1) as int;
  }

  static Future<void> setSelectedPaymentMethod(int index) async {
    await box.put(selectedPaymentKey, index);
  }

  static List<Map<String, dynamic>> getSavedCards() {
    return cardsBox.values
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();
  }

  static Future<void> addNewCard(Map<String, dynamic> card) async {
    await cardsBox.add(card);
  }

  static const String selectedCardKey = 'selected_card_index';

  static int getSelectedCard() {
    return box.get(selectedCardKey, defaultValue: -1) as int;
  }

  static Future<void> setSelectedCard(int index) async {
    await box.put(selectedCardKey, index);
  }
}
