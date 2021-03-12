import 'package:flutter/material.dart';
import 'package:flutter_bloc_auth/utils/constants.dart';
import 'package:flutter_bloc_auth/utils/strings.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Text(welcomeText, style: kWelcomeTextStyle,),
        ),
      ),
    );
  }
}
