import 'package:flutter/material.dart';

import '../pages/login.dart';

buttonL(context, double height) {
  return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const LoginPage())));
        },
        child: Image.asset(
          'assets/login-btn.png',
          height: height,
        ),
      ));
}
