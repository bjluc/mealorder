import 'package:flutter/services.dart';
import 'package:mealorder/constants.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final bool isPasswordField;
  CustomInput(
      {this.hintText,
      this.onChanged,
      this.onSubmitted,
      this.focusNode,
      this.textInputAction,
      this.isPasswordField});

  @override
  Widget build(BuildContext context) {
    bool _isPasswordField = isPasswordField ?? false;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 24.0,
      ),
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(12.0)),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        obscureText: _isPasswordField,
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        textInputAction: textInputAction,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText ?? "Hint Text...",
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.0,
              vertical: 14.0,
            )),
        style: Constants.regularDarkText,
      ),
    );
  }
}
