import 'package:flutter/material.dart';

import '../pages/signup.dart';

/*  Error is the error displayed to user
    Label is the string being displayed for clickable portion
    Callback is the method 
*/
snackBarMessage(String error, String label, void Function() callback) {
  return SnackBar(
    action: SnackBarAction(
      textColor: Color(0xFFC3B1E1),
      label: label,
      onPressed: 
        callback
        // Code to execute.
        /*if (error==
            'email-already-in-use') {
          showLogInPage();
        }*/
        //otherwise don't do anything
      
    ),
    content: Text(error),
    duration:
        const Duration(seconds: 7),
    width:
        300, // Width of the SnackBar.
    //margin: EdgeInsets.fromLTRB(300, 100, 300, 100),
    padding:
        const EdgeInsets.symmetric(
      horizontal:
          8.0, // Inner padding for SnackBar content.
    ),
    behavior:
        SnackBarBehavior.floating,
    //backgroundColor: Colors.white, //Color(0xFFC3B1E1),
    shape: RoundedRectangleBorder(
      borderRadius:
          BorderRadius.circular(
            10.0),
    ),
  );
}