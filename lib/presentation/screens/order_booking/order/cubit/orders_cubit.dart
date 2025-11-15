import 'package:fixit/core/stores/app_box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'orders_state.dart';
import '../../models/order_model.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(const OrdersState()) {
    loadOrders();
  }

  void changeTab(OrderTab tab) {
    emit(state.copyWith(selectedTab: tab));
    loadOrders();
  }

  void loadOrders() {
    emit(state.copyWith(status: OrdersStatus.loading));

    try {
      final deletedIds = AppBox.getDeletedOrders();

      final allOrders = _dummyOrders();

      final filtered = allOrders
          .where((o) => o.status == state.selectedTab)
          .where((o) => !deletedIds.contains(o.id))
          .toList();

      emit(state.copyWith(orders: filtered, status: OrdersStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          status: OrdersStatus.error,
          errorMessage: 'Failed to load orders',
        ),
      );
    }
  }

  void cancelOrder(OrderModel order) async {
    await AppBox.addDeletedOrder(order.id);

    final updatedList = List<OrderModel>.from(state.orders)..remove(order);
    emit(state.copyWith(orders: updatedList));
  }

  List<OrderModel> _dummyOrders() {
    return [
      OrderModel(
        id: '1',
        serviceName: 'Plumbing',
        amount: 200,
        plumberName: 'Emily jani',
        bookingDate: DateTime(2023, 12, 23),
        status: OrderTab.unpaid,
      ),
      OrderModel(
        id: '2',
        serviceName: 'Plumbing',
        amount: 300,
        plumberName: 'Emily jani',
        bookingDate: DateTime(2023, 12, 24),
        status: OrderTab.paid,
      ),
      OrderModel(
        id: '3',
        serviceName: 'Painter',
        amount: 600,
        plumberName: 'Lucas',
        bookingDate: DateTime(2023, 12, 7),
        status: OrderTab.paid,
      ),
      OrderModel(
        id: '4',
        serviceName: 'Plumbing',
        amount: 30,
        plumberName: 'Emily jani',
        bookingDate: DateTime(2024, 1, 4),
        arrivalTime: '10:00 AM',
        status: OrderTab.schedule,
      ),
      OrderModel(
        id: '5',
        serviceName: 'Locksmith',
        amount: 20,
        plumberName: 'Benjamin',
        bookingDate: DateTime(2024, 1, 4),
        arrivalTime: '10:00 AM',
        status: OrderTab.schedule,
      ),
    ];
  }
}
