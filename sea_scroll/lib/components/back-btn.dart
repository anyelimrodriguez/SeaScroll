import 'package:flutter/material.dart';

import '../pages/intro.dart';

buttonB(context, double height) {
  return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => Intro())));
        },
        child: Image.asset(
          'assets/backspace.png',
          height: height,
        ),
      ));
}
