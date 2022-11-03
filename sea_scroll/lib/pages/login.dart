import 'package:flutter/material.dart';
import 'package:sea_scroll/pages/home.dart';
import 'package:sea_scroll/pages/intro.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/Beach.png"), fit: BoxFit.cover),
        ),
        padding: const EdgeInsets.all(8),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Text(
                //   'Login',
                //   style: TextStyle(
                //       color: Colors.black,
                //       fontSize: 60,
                //       fontWeight: FontWeight.w200),
                // ),
                SizedBox(
                  height: 200,
                ),
                _username_field(context),
                SizedBox(
                  height: 0,
                ),
                _password_field(context),
                SizedBox(
                  height: 0,
                ),
                _enter_btn(context),
                _footer(context),
              ],
            ),
          ),
        ),
      )),
    );
  }
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

//Back button
_footer(context) {
  return Container(
    child: Stack(
      children: [
        Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                //First Icon
                Transform.scale(
                  scale: 1.5,
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) => intro())));
                      },
                      icon: ImageIcon(
                        AssetImage('assets/right-arrow (2).png'),
                        color: Colors.white,
                        size: 200,
                      )),
                ),
                SizedBox(
                  width: 40,
                ),
                //Second Icon
                Transform.scale(
                  scale: 1.5,
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) => intro())));
                      },
                      icon: ImageIcon(
                        AssetImage('assets/right-arrow (1).png'),
                        color: Colors.white,
                        size: 200,
                      )),
                ),
                SizedBox(
                  width: 40,
                ),
                //Third Icon
                Transform.scale(
                  scale: 1.5,
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) => intro())));
                      },
                      icon: ImageIcon(
                        AssetImage('assets/backspace (1).png'),
                        color: Colors.white,
                        size: 200,
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 55,
            ),
            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                Transform.scale(
                  scale: 2.6,
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) => home())));
                      },
                      icon: ImageIcon(
                        AssetImage('assets/enter.png'),
                        color: Colors.white,
                        size: 200,
                      )),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
