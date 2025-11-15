import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fixit/l10n/app_localizations.dart';
import 'package:fixit/presentation/screens/order_booking/order/cubit/orders_cubit.dart';
import 'package:fixit/presentation/screens/order_booking/order/cubit/orders_state.dart';
import '../widget/cards/order_card.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final media = MediaQuery.of(context);
    final screenWidth = media.size.width;
    final screenHeight = media.size.height;

    return BlocProvider(
      create: (_) => OrdersCubit(),
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          final cubit = context.read<OrdersCubit>();

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              centerTitle: false,
              title: Text(
                t.myOrders,
                style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff0054A5),
                  fontFamily: 'Poppins',
                ),
              ),
            ),

            body: Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.04,
                right: screenWidth * 0.04,
                top: screenHeight * 0.03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// ----------------- Tabs -----------------
                  SizedBox(
                    height: 48,
                    child: Row(
                      children: [
                        _tabButton(
                          context: context,
                          label: t.unpaid,
                          isSelected: state.selectedTab == OrderTab.unpaid,
                          onTap: () => cubit.changeTab(OrderTab.unpaid),
                        ),
                        const SizedBox(width: 8),
                        _tabButton(
                          context: context,
                          label: t.paid,
                          isSelected: state.selectedTab == OrderTab.paid,
                          onTap: () => cubit.changeTab(OrderTab.paid),
                        ),
                        const SizedBox(width: 8),
                        _tabButton(
                          context: context,
                          label: t.schedule,
                          isSelected: state.selectedTab == OrderTab.schedule,
                          onTap: () => cubit.changeTab(OrderTab.schedule),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.03),

                  Text(
                    _getSubtitle(state.selectedTab, t),
                    style: TextStyle(
                      fontSize: screenWidth * 0.037,
                      color: const Color(0xff565656),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.025),

                  /// ----------------- ORDERS LIST -----------------
                  Expanded(
                    child: state.orders.isEmpty
                        ? Center(
                            child: Text(
                              t.noOrders,
                              style: TextStyle(
                                fontSize: screenWidth * 0.045,
                                color: Colors.grey[600],
                                fontFamily: 'Poppins',
                              ),
                            ),
                          )
                        : ListView.separated(
                            padding: EdgeInsets.only(top: screenHeight * 0.015),
                            itemCount: state.orders.length,
                            separatorBuilder: (_, _) =>
                                SizedBox(height: screenHeight * 0.02),
                            itemBuilder: (context, index) {
                              final order = state.orders[index];
                              return OrderCard(order: order);
                            },
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _tabButton({
    required BuildContext context,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xff0054A5) : Colors.white,
            border: Border.all(color: const Color(0xffD9D9D9)),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              color: isSelected ? Colors.white : const Color(0xff565656),
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }

  String _getSubtitle(OrderTab tab, AppLocalizations t) {
    switch (tab) {
      case OrderTab.unpaid:
        return t.unpaidSubtitle;
      case OrderTab.paid:
        return t.paidSubtitle;
      case OrderTab.schedule:
        return t.scheduleSubtitle;
    }
  }
}
