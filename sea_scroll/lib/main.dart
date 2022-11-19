import 'package:flutter/material.dart';
import 'pages/intro.dart';
import 'package:postgres/postgres.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('something');
  //var connection = PostgreSQLConnection("10.0.2.2", 5432, "postgres", username: "postgres", password: "V:EHT]3&R;BP5sQQ");

  // var connection = PostgreSQLConnection("35.193.54.73", 5432, "postgres", username: "postgres", password: "V:EHT]3&R;BP5sQQ", isUnixSocket: true);
  // try {
  //   await connection.open();
  // } catch (e) {
  //   print(e);
  // }
  // var url = Uri.parse('https://testfunc-o6qnidhdcq-uc.a.run.app/');
  //
  // // Await the http get response, then decode the json-formatted response.
  // var response = await http.get(url);
  // if (response.statusCode == 200) {
  //   var bodyDecoded = convert.jsonDecode(response.body);
  //   for( final row in bodyDecoded) {
  //     var a = row['userid'];
  //     var b = row['name'];
  //     var c = row['bio'];
  //     var d = row['pfp'];
  //     if(d != null)
  //       print("$a" + " " + b + " " + c + " " + d);
  //     else
  //       print("$a" + " " + b + " " + c);
  //   }
  // }
  // else {
  //   print('Request failed with status: ${response.statusCode}.');
  // }
  //
  // print('happened');

  // List<List<dynamic>> results = await connection.query("SELECT * FROM users");
  // for (final row in results) {
  //   var a = row[0];
  //   var b = row[1];
  //   var c = row[2];
  //   var d = row[3];
  //   if(d != null)
  //     print("$a" + " " + b + " " + c + " " + d);
  //   else
  //     print("$a" + " " + b + " " + c);
  // }
  // print('finally');
  // connection.close();

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
      home: const Intro(),
    );
  }
}
