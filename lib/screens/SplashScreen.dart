import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'landing_page.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        PageTransition(
          child: LandingPage(),
          type: PageTransitionType.rightToLeftWithFade,
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200.0,
              width: 400.0,
              child: Lottie.asset(
                'animation/cookingApp.json',
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'Best',
                style: TextStyle(
                  fontSize: 46.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightGreen,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Taste',
                    style: TextStyle(
                      fontSize: 46.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
