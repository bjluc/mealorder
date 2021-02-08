import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';

class CartMeal extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String name;

  const CartMeal(this.id, this.productId, this.price, this.quantity, this.name);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, left: 5.0),
                      child: Container(
                        child: Text(
                          "$name",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            child: Text(
                              "$quantity x $price",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "£${(price * quantity).toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.remove,
                        size: 25.0,
                      ),
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        Provider.of<Cart>(context, listen: false)
                            .removeSingleItem(productId);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 25.0,
                      ),
                      color: Colors.green[800],
                      onPressed: () {
                        Provider.of<Cart>(context, listen: false)
                            .addItem(productId, name, price);
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: IconButton(
                    onPressed: () {
                      Provider.of<Cart>(context, listen: false)
                          .removeItem(productId);
                    },
                    color: Colors.black,
                    icon: Icon(
                      Icons.delete,
                      size: 25.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
