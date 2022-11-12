// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../components/back-btn.dart';
import '../components/elevated-box-decoration.dart';
import '../components/enter-btn.dart';
import '../components/montStyle.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  // final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
        child: Container(
          margin:
              const EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 50),
          decoration: elevatedBox(),
          child: Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: height / 15,
                ),
                montStyle('Login'),
                SizedBox(
                  height: height / 15,
                ),
                Expanded(
                    child: Column(
                  children: [
                    montStyle('Email'),
                    SizedBox(
                      height: height / 30,
                    ),
                    montStyle('Password'),
                  ],
                )),
                SizedBox(
                  height: height / 5,
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buttonB(context, height / 9),
                    buttonE(context, height / 9),
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}
