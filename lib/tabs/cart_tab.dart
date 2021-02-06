import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_action_bar.dart';
import '../widgets/cart_item.dart';
import '../provider/cart.dart' show Cart;

class CartTab extends StatefulWidget {
  @override
  _CartTabState createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Container(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 114.0),
              child: Card(
                margin: EdgeInsets.all(15.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total:',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w200,
                            color: Colors.black),
                      ),
                      Spacer(),
                      Chip(
                        label: Text(
                          '£${cart.totalAmount.toStringAsFixed(2)}',
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                        ),
                        backgroundColor: Colors.grey.shade200,
                      ),
                      FlatButton(
                        child: Text(
                          'ORDER NOW',
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 174.0),
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (ctx, i) => CartMeal(
                  cart.items.values.toList()[i].id,
                  cart.items.keys.toList()[i],
                  cart.items.values.toList()[i].price,
                  cart.items.values.toList()[i].quantity,
                  cart.items.values.toList()[i].name,
                ),
              ),
            ),
            CustomActionBar(
              hasBackArrow: false,
              title: "Cart",
            ),
          ],
        ),
      ),
    );
  }
}
