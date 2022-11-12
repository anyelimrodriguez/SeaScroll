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

  //This will be used so that sign up/in is the same page
  bool isSignUpPage = true; 

  Future<void> createUserWithEmailAndPassword() async{
    try{ 
      await Auth().createUserWithEmailAndPassword(
      email: _emailTextController.text, 
      password: _passwordTextController.text);
    } on FirebaseAuthException catch(e){
      print(e.code);
    }
  }
  Future<void> signInWithEmailAndPassword() async{
    try{ 
      await Auth().signInWithEmailAndPassword(
      email: _emailTextController.text, 
      password: _passwordTextController.text);
    } on FirebaseAuthException catch(e){
      print(e.code);
    }
  }

  //This is for the email and password fields
  Widget _entryField(
    String title,
    TextEditingController controller
  ){
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title
      )
    );
  }

  //This is the button to create account or sign in 
  Widget _submitButton(){
    return ElevatedButton(
      onPressed: isSignUpPage?createUserWithEmailAndPassword:signInWithEmailAndPassword, 
      child: Text(isSignUpPage?'Create Account':'Sign In')
    );
  }

  //This is the button to toggle between sign up/in pages so that the content displays correctly
  Widget _togglePages(){
    return TextButton(
      onPressed: (){
        setState(() {
          isSignUpPage = !isSignUpPage; //set it to the opposite of what it is
        });
      },
      child: Text(
        "${isSignUpPage ? "Already" : "Don't"} have an account? Sign ${isSignUpPage ? "In" : "Up"}"
      ));
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
                montStyle(isSignUpPage?'Signup':'Signin'),
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
                    //_entryField('Email', _emailTextController),
                    montStyle('Password'),
                    //_entryField('Password', _passwordTextController)
                  ],
                )),
                SizedBox(
                  height: height / 5,
                ),
                //_submitButton(),
                //_togglePages(),
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
