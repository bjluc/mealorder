import 'package:flutter/material.dart';
// import 'package:mealorder/provider/cart.dart';
// import 'package:provider/provider.dart';
// import '../screens/cart_page.dart';
import '../constants.dart';
import 'cart_item_total.dart';

// ignore: must_be_immutable
class CustomActionBar extends StatelessWidget {
  final String title;
  final bool hasBackArrow;
  final bool hasTitle;
  final bool hasBackground;
  CustomActionBar(
      {this.title, this.hasBackArrow, this.hasTitle, this.hasBackground});

  @override
  Widget build(BuildContext context) {
    // final cart = Provider.of<Cart>(context, listen: false);

    bool _hasBackArrow = hasBackArrow ?? false;
    bool _hasTitle = hasTitle ?? true;
    bool _hasBackground = hasBackground ?? true;

    return Container(
      decoration: BoxDecoration(
          gradient: _hasBackground
              ? LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0),
                  ],
                  begin: Alignment(0, 0),
                  end: Alignment(0, 1),
                )
              : null),
      padding: EdgeInsets.only(
        top: 60.0,
        left: 28.0,
        right: 28.0,
        bottom: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_hasBackArrow)
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 40.0,
                height: 40.0,
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage("assets/images/back_arrow.png"),
                  color: Colors.black,
                  width: 20.0,
                  height: 20.0,
                ),
              ),
            ),
          if (_hasTitle)
            Text(
              title ?? "Action Bar",
              style: Constants.boldHeading,
            ),
          Stack(
            children: [
              Container(child: CartItemTotal()),
            ],
          )
        ],
      ),
    );
  }
}
