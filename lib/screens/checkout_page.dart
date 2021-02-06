import 'package:flutter/material.dart';
// import '../services/firebase_services.dart';
import '../widgets/custom_action_bar.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 114.0),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Checkout Page',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
            ),
            CustomActionBar(
              hasBackArrow: true,
              title: "Checkout",
            ),
          ],
        ),
      ),
    );
  }
}
