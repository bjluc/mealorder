import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/orders_pages.dart';
import '../widgets/custom_action_bar.dart';
import '../widgets/cart_item.dart';
import '../provider/cart.dart' show Cart;
import '../provider/orders.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
                      OrderButton(
                        cart: cart,
                      )
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
              hasBackArrow: true,
              title: "Cart",
            ),
          ],
        ),
      ),
    );
  }
}

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: _isLoading ? CircularProgressIndicator() : Text('ORDER NOW'),
      onPressed: (widget.cart.totalAmount <= 0 || _isLoading)
          ? null
          : () async {
              setState(() {
                _isLoading = true;
              });
              await Provider.of<Orders>(context, listen: false).addOrder(
                widget.cart.items.values.toList(),
                widget.cart.totalAmount,
              );
              setState(() {
                _isLoading = false;
              });
              widget.cart.clear();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrdersPage(),
                ),
              );
            },
      textColor: Theme.of(context).primaryColor,
    );
  }
}
