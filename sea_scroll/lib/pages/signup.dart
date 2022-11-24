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

import 'login.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _secureText = true;

  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _bioTextController = TextEditingController();
  final TextEditingController _profilePicLinkTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  var urlPost = Uri.parse('https://postuser-rxfc6rk7la-uc.a.run.app/');

  Future<void> _postData(
      {required String userid, required String name, required String bio, String? pfp}) async {
    http.Response response;
    if (pfp != null) {
      response = await http
        .post(urlPost, body: {'userid': userid, 'name': name, 'bio': bio, 'pfp': pfp});
    } else {
      response = await http.post(urlPost, body: {'userid': userid, 'name': name, 'bio': bio});
    }
    if (response.statusCode == 200) {
      print('User was successfully added');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<void> createUserWithEmailAndPassword() async{
    try{ 
      await Auth().createUserWithEmailAndPassword(
        email: _emailTextController.text, 
        password: _passwordTextController.text);
      print("Successfully created user with the following info");
      
      //Updating Firebase Auth info for user 
      try{
        Auth().updateName(name: _nameTextController.text);
        print(Auth().currentUser?.displayName);
      } catch(e){
        print("There's an error in updating name");
      }
      if(_profilePicLinkTextController.text!="")
      {
        try{
          Auth().updateProfilePic(photoURL: _profilePicLinkTextController.text);
          print(Auth().currentUser?.photoURL);
        } catch(e){
          print("There's an error in updating profile picture");
        }
      }
      
      String? userID = Auth().currentUser?.uid;

      //Adding user to the user table in our database
      if(_profilePicLinkTextController.text=="") //if pfp empty, just add name/bio
      {
        _postData(
          userid: userID!,
        name: _nameTextController.text, 
        bio: _bioTextController.text,
        );
      }
      else
      {
        _postData(
          userid: userID!,
        name: _nameTextController.text, 
        bio: _bioTextController.text,
        pfp: _profilePicLinkTextController.text);
      }
    
      //If authentication was succesful, go to homepage
      Navigator.push(context,
        MaterialPageRoute(builder: ((context) => Home())));
    } on FirebaseAuthException catch(e){
      print(e.code);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[350],
      body: SafeArea(
          child: Container(
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
              // Icon(
              //   Icons.android,
              //   size: 100,
              // ),
              //Intro

              const Text(
                'Welcome!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Tell us a little bit about yourself.',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 50,
              ),

              //Name
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
                      controller: _nameTextController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Name',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              //BIO
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _bioTextController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Describe Yourself',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              // Image
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
                      controller: _profilePicLinkTextController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Image Link for Pfp (optional)',
                      ),
                    ),
                  ),
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
              
              //Sign Up Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ElevatedButton(
                  onPressed: () {
                    /*Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => Home())));*/
                    createUserWithEmailAndPassword();
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(25), 
                      backgroundColor: Colors.blue[200],
                      minimumSize: const Size.fromHeight(75),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already a member?'),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => LoginPage())));
                    },
                    child: const Text(
                      'Login Here.',
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
      )),
    );
  }
}
