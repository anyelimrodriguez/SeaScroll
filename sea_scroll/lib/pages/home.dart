// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_scroll/pages/login.dart';
import 'package:sea_scroll/pages/write.dart';
import 'package:sea_scroll/pages/signup.dart';
import '../auth.dart';

import '../components/back-btn.dart';
import '../components/elevated-box-decoration.dart';
import '../components/fetch-msg-btn.dart';
import '../components/montStyle.dart';
import '../components/schoolStyle.dart';
import 'package:postgres/postgres.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:math';

class Home extends StatefulWidget {
  const Home({super.key});

  // final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //var connection = PostgreSQLConnection("10.0.2.2", 5432, "postgres", username: "postgres", password: "V:EHT]3&R;BP5sQQ");

  //var connection = PostgreSQLConnection("35.193.54.73", 5432, "postgres", username: "postgres", password: "V:EHT]3&R;BP5sQQ");

  var url = Uri.parse('https://getusers-rxfc6rk7la-uc.a.run.app/');

  Future<List<dynamic>> _getData() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return convert.jsonDecode(response.body);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return [""];
    }
  }

  var urlPost = Uri.parse('https://postuser-rxfc6rk7la-uc.a.run.app/');

  Future<void> _postData(
      {required String name, required String bio, String? pfp}) async {
    var response;
    if (pfp != null) {
      response = await http
          .post(urlPost, body: {'name': name, 'bio': bio, 'pfp': pfp});
    } else {
      response = await http.post(urlPost, body: {'name': name, 'bio': bio});
    }
    if (response.statusCode == 200) {
      print('User was successfully added');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<void> signOut() async{
    await Auth().signOut();
    Navigator.push(context,MaterialPageRoute(
      builder: ((context) => LoginPage())));
    print("Signed out");
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<Color> colors = [
      Colors.red.shade200,
      Colors.teal,
      Colors.green.shade300,
      Colors.blue.shade300,
      Colors.yellowAccent,
      Colors.deepOrangeAccent
    ];
    Random random = Random();

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
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      // color: Colors.amber,
                      ),
                  child: FutureBuilder<List<dynamic>>(
                      future: _getData(),
                      builder: (context, AsyncSnapshot<List<dynamic>> snap) {
                        if (snap.hasData) {
                          // print(snap.data![0]);
                          return SingleChildScrollView(
                            child: Container(
                                decoration: const BoxDecoration(
                                    // color: Colors.blue,
                                    border: Border(
                                  bottom: BorderSide(
                                      width: 5, color: Colors.blueGrey),
                                )),
                                height:
                                    MediaQuery.of(context).size.height / 1.432,
                                child: ListView.builder(
                                  itemCount: snap.data!.length,
                                  itemBuilder: (context, index) {
                                    // print(snap.data!.length);
                                    var name =
                                        snap.data![index]['name'].toString();
                                    return GestureDetector(
                                        onTap: () {
                                          var pfplink;
                                          if (snap.data![index]['pfp'] ==
                                              null) {
                                            pfplink =
                                                'https://ia801703.us.archive.org/6/items/twitter-default-pfp/e.png';
                                          } else {
                                            pfplink = snap.data![index]['pfp']
                                                .toString();
                                          }
                                          _showFullModal(
                                              context,
                                              snap.data![index]['name']
                                                  .toString(),
                                              snap.data![index]['bio']
                                                  .toString(),
                                              pfplink);
                                        },
                                        child: Container(
                                            height: 60,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Color.fromRGBO(
                                                    239, 253, 255, 1)),
                                            alignment: Alignment.centerLeft,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 2),
                                            child: Row(children: [
                                              Container(
                                                  height: 40,
                                                  margin:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 0, 20, 0),
                                                  child: CircleAvatar(
                                                      backgroundColor: colors[
                                                          random.nextInt(
                                                              colors.length)],
                                                      child: Text(
                                                          name[0].toUpperCase(),
                                                          style: const TextStyle(
                                                              fontSize: 18,
                                                              fontFamily:
                                                                  'Roboto',
                                                              color: Colors
                                                                  .black)))),
                                              Material(
                                                child: Text(name.toUpperCase(),
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: 'Roboto',
                                                        color: Colors.teal,
                                                        backgroundColor:
                                                            Color.fromRGBO(239,
                                                                253, 255, 1),
                                                        fontWeight:
                                                            FontWeight.w400)),
                                              )
                                            ])));
                                  },
                                )),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }),
                ),
              ),
              // Container(
              //     width: 400,
              //     decoration: const BoxDecoration(
              //         color: Colors.red,
              //         border: Border(
              //           bottom: BorderSide(width: 2),
              //         )),
              //     child: Align(
              //       alignment: Alignment.center,
              //       child: Container(
              //           margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              //           width: 200,
              //           child: ElevatedButton(
              //               onPressed: () {
              //                 _postData(
              //                     name: 'Snowball',
              //                     bio: 'Pure evil',
              //                     pfp: 'https://wallpaper.dog/large/7756.jpg');
              //                 Future.delayed(const Duration(milliseconds: 2000),
              //                     () {
              //                   Navigator.push(
              //                       context,
              //                       MaterialPageRoute(
              //                           builder: ((context) => Home())));
              //                 });
              //               },
              //               child: Text("Add Myself"))),
              //     )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      signOut();
                      /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => LoginPage())));*/
                    },
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => Write()),
                        ),
                      );
                    },
                    child: Text(
                      'Get Message',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

_showFullModal(context, String name, String bio, String pfpLink) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false, // should dialog be dismissed when tapped outside
    barrierLabel: "Modal", // label for barrier
    transitionDuration: const Duration(
        milliseconds:
            500), // how long it takes to popup dialog after button click
    pageBuilder: (_, __, ___) {
      // your widget implementation
      double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
      return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: Text(
              name,
              style: const TextStyle(
                  color: Colors.black87, fontFamily: 'Overpass', fontSize: 20),
            ),
            elevation: 0.0),
        backgroundColor: Colors.white.withOpacity(0.90),
        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Color(0xfff8f8f8),
                width: 1,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(pfpLink,
                          width: width / 2,
                          height: width / 2,
                          fit: BoxFit.cover))),
              const SizedBox(
                height: 20,
              ),
              montStyle(bio)
            ],
          ),
        ),
      );
    },
  );
}
