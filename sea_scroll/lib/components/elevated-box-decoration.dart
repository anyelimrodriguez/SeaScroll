import 'package:flutter/material.dart';

elevatedBox() {
  return BoxDecoration(
    color: Colors.white,
    border: Border.all(
      color: Colors.blueGrey,
      width: 4,
    ),
    borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10)),
  );
}
