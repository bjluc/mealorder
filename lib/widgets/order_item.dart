import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../screens/home_page.dart';
import '../provider/orders.dart';

class OrderMeal extends StatefulWidget {
  final OrderItem order;

  OrderMeal(this.order);

  @override
  _OrderMealState createState() => _OrderMealState();
}

class _OrderMealState extends State<OrderMeal> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5.0),
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     SizedBox(
          //       child: IconButton(
          //         icon: Icon(
          //           Icons.remove,
          //           size: 25.0,
          //         ),
          //         color: Theme.of(context).accentColor,
          //         onPressed: () {
          //           Provider.of<Orders>(context, listen: false).removeOrder();
          //           Navigator.pushReplacement(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) => HomePage(),
          //               ));
          //         },
          //       ),
          //     )
          //   ],
          // ),
          ListTile(
            title: Text(
              '£${widget.order.amount.toStringAsFixed(2)}',
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
            subtitle: Text(
              DateFormat('dd/MM/yyyy  H:mm').format(widget.order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              height: min(widget.order.products.length * 20.0 + 50, 130),
              child: Ink(
                padding: EdgeInsets.all(2.0),
                color: Colors.grey.shade100,
                child: ListView(
                  children: widget.order.products
                      .map((prod) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                prod.name,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${prod.quantity}x £${prod.price}',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ))
                      .toList(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
