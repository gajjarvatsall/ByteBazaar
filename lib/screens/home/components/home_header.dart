import 'package:e_commerce_app_flutter/components/rounded_icon_button.dart';
import 'package:e_commerce_app_flutter/components/search_field.dart';
import 'package:e_commerce_app_flutter/constants.dart';
import 'package:flutter/material.dart';

import '../../../components/icon_button_with_counter.dart';

class HomeHeader extends StatelessWidget {
  final Function onSearchSubmitted;
  final Function onCartButtonPressed;
  const HomeHeader({
    Key key,
    @required this.onSearchSubmitted,
    @required this.onCartButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            icon: Icon(Icons.menu),
            color: kTextColor,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            }),
        Expanded(
          child: SearchField(
            onSubmit: onSearchSubmitted,
          ),
        ),
        SizedBox(width: 5),
        IconButtonWithCounter(
          svgSrc: "assets/icons/Cart Icon.svg",
          numOfItems: 0,
          press: onCartButtonPressed,
        ),
      ],
    );
  }
}
