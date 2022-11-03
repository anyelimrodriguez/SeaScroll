import 'package:flutter/material.dart';

import 'home.dart';

class signup extends StatelessWidget {
  const signup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/Beach.png"), fit: BoxFit.cover),
        ),
        padding: EdgeInsets.all(8),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 230,
              ),
              _email_field(context),
              _username_field(context),
              _password_field(context),
              _enter_btn(context),
            ],
          ),
        ),
      )),
    );
  }
}

//Email text field

_email_field(context) {
  return Container(
    padding: EdgeInsets.all(8),
    child: Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          // height: 50,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 20, bottom: 20, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 300,
                child: TextFormField(
                    autocorrect: true,
                    textAlign: TextAlign.center,
                    style: null,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        hintText: 'Email',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(248, 219, 184, 1),
                            fontWeight: FontWeight.bold))),
              )
            ],
          ),
        ),
        Positioned(
          right: 275,
          top: 0,
          bottom: 20,
          child: Transform.rotate(
            angle: 50,
            child: Transform.scale(
              scale: 1.0,
              child: const Image(
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

//Username text field
_username_field(context) {
  return Container(
    padding: EdgeInsets.all(8),
    child: Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          // height: 50,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 20, bottom: 20, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 300,
                child: TextFormField(
                    autocorrect: true,
                    textAlign: TextAlign.center,
                    style: null,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        hintText: 'USERNAME',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(248, 219, 184, 1),
                            fontWeight: FontWeight.bold))),
              )
            ],
          ),
        ),
        Positioned(
          right: 275,
          top: 0,
          bottom: 20,
          child: Transform.rotate(
            angle: 50,
            child: Transform.scale(
              scale: 1.0,
              child: const Image(
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

//Password text field
_password_field(context) {
  return Container(
    padding: EdgeInsets.all(8),
    child: Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          // height: 50,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 20, bottom: 20, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 300,
                child: TextFormField(
                  autocorrect: true,
                  textAlign: TextAlign.center,
                  style: null,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      hintText: 'PASSWORD',
                      hintStyle: TextStyle(
                          color: Color.fromARGB(248, 219, 184, 1),
                          fontWeight: FontWeight.bold)),
                  obscureText: true,
                ),
              )
            ],
          ),
        ),
        Positioned(
          right: 275,
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

//Login button
_enter_btn(context) {
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
                      MaterialPageRoute(builder: ((context) => home())));
                },
                child: Text(
                  'Enter',
                  style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(248, 219, 184, 1),
                      fontWeight: FontWeight.w500),
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
          right: 60,
          top: 0,
          bottom: 20,
          child: Transform.rotate(
            angle: 0,
            child: Transform.scale(
              scale: 1.0,
              child: new Image(
                image: AssetImage('assets/feather-pen.png'),
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
