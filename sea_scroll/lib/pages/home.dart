// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/back-btn.dart';
import '../components/elevated-box-decoration.dart';
import '../components/fetch-msg-btn.dart';
import '../components/montStyle.dart';
import '../components/schoolStyle.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  // final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                // SizedBox(
                //   height: height / 40,
                // ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    schoolStyle('Welcome to'),
                    Image(
                        image: const AssetImage('assets/ss-logo.png'),
                        height: height / 9),
                  ],
                )),
                SizedBox(
                  height: height / 30,
                ),
                Container(
                    height: height / 2,
                    width: 400,
                    decoration: BoxDecoration(
                        // color: Colors.amber,
                        border: Border(
                      top: BorderSide(width: 2),
                      bottom: BorderSide(width: 2),
                    )),
                    child: SingleChildScrollView(
                      child: Expanded(
                        child: Column(
                          children: [
                            montStyle('hiiiiiiiiiiiiii'),
                            montStyle('hiiii'),
                            montStyle('hiiii'),
                            montStyle('hiiii'),
                            montStyle('hiiii'),
                            montStyle('hiiii'),
                            montStyle('hiiii'),
                            montStyle('hiiii'),
                            montStyle('hiiii'),
                            montStyle('hiiii'),
                            montStyle('hiiii'),
                            montStyle('hiiii'),
                          ],
                        ),
                      ),
                    )),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buttonB(context, height / 9),
                    buttonF(context, height / 9),
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}
