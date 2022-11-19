import 'package:flutter/material.dart';
import 'package:sea_scroll/pages/write.dart';

import '../pages/home.dart';

buttonF(context, double height) {
  return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => Write())));
        },
        child: Image.asset(
          'assets/fetch-msg-btn.png',
          height: height,
        ),
      ));
}
