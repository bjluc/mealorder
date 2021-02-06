import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/cart_page.dart';
import '../widgets/badge.dart';
import '../provider/cart.dart';

class CartItemTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (_, cart, ch) => Badge(
        child: ch,
        value: cart.itemCount.toString(),
      ),
      child: IconButton(
        icon: Icon(
          Icons.shopping_cart,
          size: 35.0,
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage(),
              ));
        },
      ),
    );
  }
}
