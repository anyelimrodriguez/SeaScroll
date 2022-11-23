// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_scroll/pages/home.dart';
import 'package:sea_scroll/pages/login.dart';
import 'package:sea_scroll/pages/write.dart';
import 'package:sea_scroll/pages/signup.dart';

import '../components/back-btn.dart';
import '../components/elevated-box-decoration.dart';
import '../components/fetch-msg-btn.dart';
import '../components/montStyle.dart';
import '../components/schoolStyle.dart';
import 'package:postgres/postgres.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:math';

class Write extends StatefulWidget {
  const Write({super.key});

  @override
  State<Write> createState() => _WriteState();
}

class _WriteState extends State<Write> {
// Random button
  final random = Random();

  // Message Editing Conroller for TextField for Message
  final TextEditingController _messageController = TextEditingController();

  // Random Array of Colors
  List<Color> colors = [
    Colors.red.shade200,
    Colors.teal,
    Colors.green.shade300,
    Colors.blue.shade300,
    Colors.yellowAccent,
    Colors.deepOrangeAccent
  ];

  // Cloud Function Used here to get all Scrolls
  var url = Uri.parse('https://getscrolls-rxfc6rk7la-uc.a.run.app/');
  Future<dynamic> _getScrolls() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // All the data in a array(json objects), all the Scrolls
      var data = convert.jsonDecode(response.body);
      print(data.length);
      // Getting random JSON object with a random function
      int randInt = random.nextInt(data.length);

      // Return random JSON object , the random Scroll
      return data[randInt];
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return {};
    }
  }

  // Cloud Function used here to post a messsage to Scroll
  var urlPost = Uri.parse('https://postmessage-rxfc6rk7la-uc.a.run.app/');

  Future<void> _postMessage(
      {required String message, required String id}) async {
    print('process started');
    var response =
        await http.post(urlPost, body: {'message': message, 'id': id});
    if (response.statusCode == 200) {
      print('Message was successfully added');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    print('process ended');
  }

  // State Code for the future bulider, run the future once only in the beggning of the rendering of the page
  Future? _data;

  @override
  void initState() {
    super.initState();
    _data = _getScrolls();
  }

  @override
  Widget build(BuildContext context) {
    bool _secureText = false;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[350],
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/writing-bg.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Center(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              height: height / 1.2,
              decoration: BoxDecoration(
                color: Colors.orange[100],
                border: Border.all(
                  color: Color.fromARGB(255, 191, 131, 53),
                  width: 4,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,

                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => Home()),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_back),
                    iconSize: 50,
                  ),
                  //Intro

                  //Email textfield

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: const BoxDecoration(
                          // color: Colors.amber,
                          ),
                      child: FutureBuilder<dynamic>(
                          future: _data,
                          builder: (context, AsyncSnapshot<dynamic> snap) {
                            if (snap.hasData) {
                              return Column(
                                children: [
                                  Container(
                                    height: height / 1.7,
                                    width: width / 1.3,
                                    decoration: BoxDecoration(
                                      // color: Colors.blueAccent,
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 244, 191, 122),
                                        width: 4,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: ListView.builder(
                                        itemCount:
                                            snap.data!['messages'].length,
                                        itemBuilder: (context, index) {
                                          print(snap.data!);
                                          return Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Color.fromRGBO(
                                                    239, 253, 255, 1),
                                              ),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: CircleAvatar(
                                                      backgroundColor: colors[
                                                          random.nextInt(
                                                              colors.length)],
                                                      child: Image.network(
                                                          'https://ia801703.us.archive.org/6/items/twitter-default-pfp/e.png'),
                                                      radius: height / 20,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(snap.data!['messages']
                                                      [index]),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 244, 191, 122),
                                      // border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: TextField(
                                        obscureText: _secureText,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Whats on your mind?',
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              print(snap.data!["scrollid"]);
                                              print(_messageController.text);
                                              if (_messageController.text !=
                                                  '') {
                                                _postMessage(
                                                    message:
                                                        _messageController.text,
                                                    id: (snap.data!["scrollid"]
                                                        .toString()));
                                              }

                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: ((context) =>
                                                          Home())));
                                            },
                                            icon: const Icon(Icons.send),
                                          ),
                                        ),
                                        controller: _messageController,
                                      ),
                                    ),
                                  ),
                                  //   Row(
                                  //     children: <Widget>[
                                  //       SizedBox(
                                  //           height: height / 11,
                                  //           width: width / 5),
                                  //       Container(
                                  //         height: height / 2,
                                  //         width: width / 2,
                                  //         alignment: Alignment.center,
                                  //         padding: EdgeInsets.all(20),
                                  //         child: TextField(
                                  //           decoration: InputDecoration(
                                  //               hintText: "Enter Message"),
                                  //           controller: _messageController,
                                  //         ),
                                  //       ),
                                  //       ElevatedButton(
                                  //         onPressed: () {
                                  //           print(snap.data!["scrollid"]);
                                  //           print(_messageController.text);
                                  //           _postMessage(
                                  //               message: _messageController.text,
                                  //               id: (snap.data!["scrollid"]
                                  //                   .toString()));
                                  //           Navigator.push(
                                  //               context,
                                  //               MaterialPageRoute(
                                  //                   builder: ((context) =>
                                  //                       Home())));
                                  //         },
                                  //         child: Text('Sub'),
                                  //       ),
                                  //     ],
                                  //   ),
                                ],
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //Password textfield
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 25),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       color: Colors.purple,
                  //       // border: Border.all(color: Colors.white),
                  //       borderRadius: BorderRadius.circular(12),
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(left: 20.0),
                  //       child: TextField(
                  //         obscureText: _secureText,
                  //         decoration: InputDecoration(
                  //           border: InputBorder.none,
                  //           hintText: 'Whats on your mind?',
                  //           suffixIcon: IconButton(
                  //             onPressed: () {
                  //               // print(snap.data!["scrollid"]);
                  //               // print(_messageController.text);
                  //               // _postMessage(
                  //               //     message: _messageController.text,
                  //               //     id: (snap.data!["scrollid"].toString()));
                  //               // Navigator.push(
                  //               //     context,
                  //               //     MaterialPageRoute(
                  //               //         builder: ((context) => Home())));
                  //             },
                  //             icon: const Icon(Icons.send),
                  //           ),
                  //         ),
                  //         controller: _messageController,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        )),
      )),
    );
  }
}

// _showFullModal(context, String name, String bio, String pfpLink) {
//   showGeneralDialog(
//     context: context,
//     barrierDismissible: false, // should dialog be dismissed when tapped outside
//     barrierLabel: "Modal", // label for barrier
//     transitionDuration: const Duration(
//         milliseconds:
//             500), // how long it takes to popup dialog after button click
//     pageBuilder: (_, __, ___) {
//       // your widget implementation
//       double width = MediaQuery.of(context).size.width;
//       double height = MediaQuery.of(context).size.height;
//       return Scaffold(
//         appBar: AppBar(
//             backgroundColor: Colors.white,
//             centerTitle: true,
//             leading: IconButton(
//                 icon: const Icon(
//                   Icons.close,
//                   color: Colors.black,
//                 ),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 }),
//             title: Text(
//               name,
//               style: const TextStyle(
//                   color: Colors.black87, fontFamily: 'Overpass', fontSize: 20),
//             ),
//             elevation: 0.0),
//         backgroundColor: Colors.white.withOpacity(0.90),
//         body: Container(
//           padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
//           decoration: const BoxDecoration(
//             border: Border(
//               top: BorderSide(
//                 color: Color(0xfff8f8f8),
//                 width: 1,
//               ),
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Align(
//                   alignment: Alignment.center,
//                   child: ClipRRect(
//                       borderRadius: BorderRadius.circular(20),
//                       child: Image.network(pfpLink,
//                           width: width / 2,
//                           height: width / 2,
//                           fit: BoxFit.cover))),
//               const SizedBox(
//                 height: 20,
//               ),
//               montStyle(bio)
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }

// child: FutureBuilder<List<dynamic>>(
//     future: _getData(),
//     builder:
//         (context, AsyncSnapshot<List<dynamic>> snap) {
//       if (snap.hasData) {
//         // print(snap.data![0]);
//         return SingleChildScrollView(
//           child: Container(
//               decoration: const BoxDecoration(
//                 color: Colors.blue,
//               ),
//               height: MediaQuery.of(context).size.height /
//                   1.432,
//               child: ListView.builder(
//                 itemCount: snap.data!.length,
//                 itemBuilder: (context, index) {
//                   // print(snap.data!.length);
//                   var name = snap.data![index]['name']
//                       .toString();
//                   return GestureDetector(
//                       onTap: () {
//                         var pfplink;
//                         if (snap.data![index]['pfp'] ==
//                             null) {
//                           pfplink =
//                               'https://ia801703.us.archive.org/6/items/twitter-default-pfp/e.png';
//                         } else {
//                           pfplink = snap.data![index]
//                                   ['pfp']
//                               .toString();
//                         }
//                         _showFullModal(
//                             context,
//                             snap.data![index]['name']
//                                 .toString(),
//                             snap.data![index]['bio']
//                                 .toString(),
//                             pfplink);
//                       },
//                       child: Container(
//                           height: 60,
//                           decoration: BoxDecoration(
//                               borderRadius:
//                                   BorderRadius.circular(
//                                       20),
//                               color: const Color.fromRGBO(
//                                   239, 253, 255, 1)),
//                           alignment: Alignment.centerLeft,
//                           margin:
//                               const EdgeInsets.symmetric(
//                                   horizontal: 0,
//                                   vertical: 2),
//                           child: Row(children: [
//                             Container(
//                                 height: 40,
//                                 margin:
//                                     const EdgeInsets.fromLTRB(
//                                         10, 0, 20, 0),
//                                 child: CircleAvatar(
//                                     backgroundColor:
//                                         colors[random.nextInt(
//                                             colors
//                                                 .length)],
//                                     child: Text(
//                                         name[0]
//                                             .toUpperCase(),
//                                         style: const TextStyle(
//                                             fontSize: 18,
//                                             fontFamily:
//                                                 'Roboto',
//                                             color: Colors
//                                                 .black)))),
//                             Text(name.toUpperCase(),
//                                 style: const TextStyle(
//                                     fontSize: 20,
//                                     fontFamily: 'Roboto',
//                                     color: Colors.teal,
//                                     fontWeight:
//                                         FontWeight.w400))
//                           ])));
//                 },
//               )),
//         );
//       } else {
//         return const Center(
//             child: CircularProgressIndicator());
//       }
//     }),
