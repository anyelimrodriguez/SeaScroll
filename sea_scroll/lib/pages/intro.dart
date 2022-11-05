// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../components/login-btn.dart';
import '../components/signup-btn.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/sand-bg.png'),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Expanded(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height / 3,
            ),
            buttonL(context, height / 8),
            SizedBox(
              height: height / 8,
            ),
            buttonS(context, height / 12)
          ],
        ),
      ),
    );
  }
}
