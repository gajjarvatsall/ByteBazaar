import 'package:e_commerce_app_flutter/wrappers/authentification_wrapper.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: appName,
        debugShowCheckedModeBanner: false,
        theme: theme().copyWith(
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: const Color(0xFF29577E),
              ),
        ),
        home: AuthentificationWrapper()
        //home: AuthentificationWrapper(),
        );
  }
}
