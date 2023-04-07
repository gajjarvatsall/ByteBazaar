import 'package:e_commerce_app_flutter/constants.dart';
import 'package:e_commerce_app_flutter/screens/home/home_screen.dart';
import 'package:e_commerce_app_flutter/services/authentification/authentification_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'sign_in_form.dart';

import '../../../size_config.dart';
import 'package:flutter/material.dart';
import '../../../components/no_account_text.dart';

class Body extends StatefulWidget {
  /// is selected value here
  String isSelected;
  @override
  State<Body> createState() => _BodyState();
  Body(
    this.isSelected, {
    Key key,
  }) : super(key: key);
}

class _BodyState extends State<Body> {
  AuthentificationService authentificationService = AuthentificationService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(screenPadding)),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Welcome Back",
                  style: headingStyle,
                ),
                Text(
                  "Sign in with your email and password",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignInForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Center(
                  child: Text("Or"),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                SizedBox(
                  width: double.infinity,
                  height: getProportionateScreenHeight(56),
                  child: ElevatedButton.icon(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: const FaIcon(FontAwesomeIcons.google),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () async {
                        bool result = await authentificationService.googleAuthUser(context, widget.isSelected);
                        if (result) {
                          Navigator.pushAndRemoveUntil(
                              context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
                        }
                      },
                      label: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Text(
                          "Continue with Google",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                NoAccountText(widget.isSelected),
                SizedBox(height: getProportionateScreenHeight(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
