import '../../models/order_model.dart';

enum OrderTab { unpaid, paid, schedule }

enum OrdersStatus { initial, loading, success, error }

class OrdersState {
  final OrderTab selectedTab;
  final List<OrderModel> orders;
  final OrdersStatus status;
  final String? errorMessage;

  const OrdersState({
    this.selectedTab = OrderTab.unpaid,
    this.orders = const [],
    this.status = OrdersStatus.initial,
    this.errorMessage,
  });

  OrdersState copyWith({
    OrderTab? selectedTab,
    List<OrderModel>? orders,
    OrdersStatus? status,
    String? errorMessage,
  }) {
    return OrdersState(
      selectedTab: selectedTab ?? this.selectedTab,
      orders: orders ?? this.orders,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
