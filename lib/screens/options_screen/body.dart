import 'package:e_commerce_app_flutter/screens/sign_in/sign_in_screen.dart';

import '../../../size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<bool> isSelected = <bool>[true, false];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12), child: Image.asset('assets/images/byte_bazaar_logo.png')),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Image.asset('assets/images/byte_bazaar_text.png'),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 30),
          Text("Who are you ?"),
          SizedBox(height: MediaQuery.of(context).size.height / 30),
          ToggleButtons(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Customer"),
                ),
              ),
              Text("     Seller     "),
            ],
            onPressed: (int index) {
              setState(() {
                for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                  if (buttonIndex == index) {
                    isSelected[buttonIndex] = true;
                  } else {
                    isSelected[buttonIndex] = false;
                  }
                }
              });
              print('$isSelected');
            },
            isSelected: isSelected,
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 30),
          ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignInScreen(isSelected: isSelected[0] == true ? 'Customer' : 'Seller')),
                    (route) => false);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text("Continue"))
        ],
      ),
    ));
  }
}
