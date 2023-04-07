import 'package:e_commerce_app_flutter/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app_flutter/size_config.dart';
import 'package:e_commerce_app_flutter/constants.dart';

class NoAccountText extends StatefulWidget {
  String isSelected;
  NoAccountText(
    this.isSelected, {
    Key key,
  }) : super(key: key);

  @override
  State<NoAccountText> createState() => _NoAccountTextState();
}

class _NoAccountTextState extends State<NoAccountText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(16),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUpScreen(isSelected: widget.isSelected)));
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(16),
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
