import 'package:flutter/material.dart';

class Allergen extends StatefulWidget {
  final List allergen;

  const Allergen({Key key, this.allergen}) : super(key: key);

  @override
  AllergenState createState() => AllergenState();
}

class AllergenState extends State<Allergen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (var i = 0; i < widget.allergen.length; i++)
          Container(
            margin: EdgeInsets.only(bottom: 2.0),
            width: 220.0,
            height: 35.0,
            decoration: BoxDecoration(
              color: Color(0xFFDCDCDC),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${widget.allergen[i]}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 12.0,
                ),
              ),
            ),
          )
      ],
    );
  }
}
