import 'package:flutter/material.dart';
import 'package:sea_scroll/pages/login.dart';
import 'package:sea_scroll/pages/signup.dart';

class intro extends StatelessWidget {
  const intro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        // alignment: Alignment.center,
        // padding: EdgeInsets.all(8),
        // constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/Beach.png"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: 230,
                  ),
                  _header(context),
                  SizedBox(
                    height: 0,
                  ),
                  _login_btn(context),
                  SizedBox(
                    height: 0,
                  ),
                  _signup_btn(context)
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

//Logo
_header(context) {
  return Container(
      alignment: Alignment.center,
      child: Image.asset(
        'assets/Sea_Scroll logo.png',
        // width: 200,
        // height: 200,
        scale: 2.0,
      ));
}

//Login button
_login_btn(context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    child: Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 20, bottom: 20, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => login())));
                },
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                ),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  backgroundColor: Colors.white,
                  padding:
                      EdgeInsets.only(top: 16, bottom: 16, left: 60, right: 60),
                ),
                // onPressed: onPressed,
                // child: child
              ),
            ],
          ),
        ),
        Positioned(
          right: 195,
          top: 0,
          bottom: 20,
          child: Transform.rotate(
            angle: 50,
            child: Transform.scale(
              scale: 1.0,
              child: new Image(
                image: AssetImage('assets/message-in-a-bottle.png'),
                // AssetImage('assets/message-in-a-bottle.png'),
                // size: 170,
                // color: Color.fromARGB(255, 21, 154, 6),
              ),
            ),
          ),
        )
      ],
    ),
  );
}

//Sign up button
_signup_btn(context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    child: Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 20, bottom: 20, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => signup())));
                },
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                ),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  backgroundColor: Colors.white,
                  padding:
                      EdgeInsets.only(top: 16, bottom: 16, left: 60, right: 60),
                ),
                // onPressed: onPressed,
                // child: child
              ),
            ],
          ),
        ),
        Positioned(
          right: 205,
          top: 0,
          bottom: 20,
          child: Transform.rotate(
            angle: 50,
            child: Transform.scale(
              scale: 1.0,
              child: new Image(
                image: AssetImage('assets/message-in-a-bottle.png'),
                // AssetImage('assets/message-in-a-bottle.png'),
                // size: 170,
                // color: Color.fromARGB(255, 21, 154, 6),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
