import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/home_background.png"),
              fit: BoxFit.cover),
        ),
        padding: EdgeInsets.all(12),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: 'Text Box for Chats '),
              )
            ],
          ),
        ),
      )),
    );
  }
}
