// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth.dart';

import '../components/back-btn.dart';
import '../components/elevated-box-decoration.dart';
import '../components/enter-btn.dart';
import '../components/montStyle.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  // final String title;

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  Future<void> createUserWithEmailAndPassword() async{
    try{ 
      await Auth().createUserWithEmailAndPassword(
      email: _emailTextController.text, 
      password: _passwordTextController.text);
    } on FirebaseAuthException catch(e){
      print(e.code);
    }
  }

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
                montStyle('Signup'),
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
                    /*TextField(
                      controller: _emailTextController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                      )
                    ),*/
                    montStyle('Password'),
                    /*TextField(
                      controller: _passwordTextController,
                      decoration: InputDecoration(
                      )
                    ),*/
                  ],
                )),
                SizedBox(
                  height: height / 5,
                ),
                /*ElevatedButton(
                  onPressed: createUserWithEmailAndPassword, 
                  child: Text('Create Account')),*/
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
