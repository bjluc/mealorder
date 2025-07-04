import 'package:flutter/foundation.dart';
import '../services/firebase_services.dart';
import 'package:uuid/uuid.dart';

import './cart.dart';

var uuid = Uuid();

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    DateTime timeStamp = DateTime.now();
    FirebaseServices _firebaseServices = FirebaseServices();

    await _firebaseServices.usersRef
        .doc(_firebaseServices.getUserId())
        .collection("Orders")
        .doc()
        .set({
      "amount": total.toStringAsFixed(2),
      "dateTime": timeStamp.toIso8601String(),
      "products": cartProducts
          .map((cp) => {
                "id": cp.id,
                "name": cp.name,
                "quantity": cp.quantity,
                "price": cp.price
              })
          .toList()
    });

    _orders.insert(
      0,
      OrderItem(
        id: uuid.v4(),
        amount: total,
        dateTime: timeStamp,
        products: cartProducts,
      ),
    );

    notifyListeners();
  }

  void removeOrder() {
    _orders = [];
    notifyListeners();
  }
}
