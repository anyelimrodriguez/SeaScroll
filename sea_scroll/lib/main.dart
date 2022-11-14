import 'package:flutter/material.dart';
import 'pages/intro.dart';
import 'package:postgres/postgres.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('something');
  var connection = PostgreSQLConnection("10.0.2.2", 5432, "postgres", username: "postgres", password: "V:EHT]3&R;BP5sQQ");
  try {
    await connection.open();
  } catch (e) {
    print(e);
  }
  print('happened');

  List<List<dynamic>> results = await connection.query("SELECT * FROM users");
  for (final row in results) {
    var a = row[0];
    var b = row[1];
    var c = row[2];
    var d = row[3];
    if(d != null)
      print("$a" + " " + b + " " + c + " " + d);
    else
      print("$a" + " " + b + " " + c);
  }
  print('finally');
  connection.close();

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
