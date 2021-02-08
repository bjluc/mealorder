import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import '../services/firebase_services.dart';
import '../widgets/custom_action_bar.dart';
import '../widgets/order_item.dart';
import '../provider/orders.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Container(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 114.0),
              child: ListView.builder(
                itemCount: orderData.orders.length,
                itemBuilder: (ctx, i) => OrderMeal(orderData.orders[i]),
              ),
            ),
            CustomActionBar(
              hasBackArrow: true,
              title: "Orders",
            ),
          ],
        ),
      ),
    );
  }
}
