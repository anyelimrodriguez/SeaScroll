import 'package:flutter/material.dart';

import '../pages/signup.dart';

buttonS(context, double height) {
  return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const RegisterPage())));
        },
        child: Image.asset(
          'assets/signup-btn.png',
          height: height,
        ),
      ));
}
