import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/cart_page.dart';
import '../widgets/badge.dart';
import '../provider/cart.dart';

class CartItemTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Consumer<Cart>(
      builder: (_, cart, ch) => Badge(
        child: ch,
        value: cart.itemCount.toString(),
      ),
      child: IconButton(
        icon: Icon(
          Icons.shopping_basket_outlined,
          size: 40.0,
        ),
        onPressed: () {
          print(cart.itemCount);
          if (cart.itemCount == 0) {
            return false;
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ));
          }
        },
      ),
    );
  }
}
