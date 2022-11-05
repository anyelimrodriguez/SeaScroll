import 'package:flutter/material.dart';

import '../pages/home.dart';

buttonE(context, double height) {
  return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => Home())));
        },
        child: Image.asset(
          'assets/right-arrow.png',
          height: height,
        ),
      ));
}
