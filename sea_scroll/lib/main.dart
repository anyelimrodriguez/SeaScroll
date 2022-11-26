import 'package:flutter/material.dart';
import 'package:sea_scroll/pages/home.dart';
import 'package:sea_scroll/pages/intro.dart';
import 'pages/login.dart';
import 'package:postgres/postgres.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print('something');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
