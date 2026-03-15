import 'package:flutter/material.dart';
import 'package:fruits_hub/features/profile/presentation/view/views/OrdersView/widgets/OrderItem.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const OrderItem();
      },
    );
  }
}
