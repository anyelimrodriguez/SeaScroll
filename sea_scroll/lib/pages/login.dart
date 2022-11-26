// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sea_scroll/pages/home.dart';
import '../auth.dart';

import '../components/back-btn.dart';
import '../components/elevated-box-decoration.dart';
import '../components/enter-btn.dart';
import '../components/montStyle.dart';

import '../components/snackbar-message.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _secureText = true;

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  void showSignUpPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => RegisterPage())));
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _emailTextController.text,
          password: _passwordTextController.text);
      print("Successfully signed in, curr user info: ");
      print("Email: ${Auth().currentUser?.email}");
      print("Name${Auth().currentUser?.displayName}");
      print("PFP${Auth().currentUser?.photoURL}");

      //if successful
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => Home())));
    } on FirebaseAuthException catch (e) {
      print(e.code);
      //If there are errors, send a message to let the user know
      String errorMessage = "";
      if (e.code == 'invalid-email') {
        errorMessage = "The email entered is invalid.";
        print('Email invalid');
      } else if (e.code == 'user-disabled') {
        errorMessage = "Your account has been disabled.";
        print('User disabled');
      } else if (e.code == 'user-not-found') {
        errorMessage = "No account has been found with this email.";
        print('User not found');
      } else if (e.code == 'wrong-password') {
        errorMessage = "You entered the wrong password.";
        print('Wrong Password');
      } else {
        errorMessage = "Something is wrong.";
      }
      ScaffoldMessenger.of(context).showSnackBar(snackBarMessage(
          errorMessage, e.code == 'user-not-found' ? "Sign Up" : "Try again",
          () {
        if (e.code == 'user-not-found') {
          showSignUpPage();
        }
        //otherwise don't do anything
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.grey[350],
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/sand-bg.png'),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Center(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Container(
                  height: 150,
                  child: Image.asset('assets/ss-logo.png'),
                ),
                // Icon(
                //   Icons.android,
                //   size: 100,
                // ),
                //Intro

                const Text(
                  'Hello Again!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Welcome back, you\'ve been missed!',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),

                //Email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _emailTextController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                //Password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _passwordTextController,
                        obscureText: _secureText,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _secureText = !_secureText;
                                });
                              },
                              icon: Icon(_secureText
                                  ? Icons.remove_red_eye
                                  : Icons.remove_red_eye_outlined),
                            )),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ElevatedButton(
                    onPressed: () {
                      signInWithEmailAndPassword();
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(25),
                        backgroundColor: Colors.blue[200],
                        minimumSize: const Size.fromHeight(75),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text('Not a member?'),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => RegisterPage())));
                      },
                      child: const Text(
                        'Register Here.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
        ));
  }
}
