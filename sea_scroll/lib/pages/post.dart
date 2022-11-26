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

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  // Message Editing Conroller for TextField for Message
  final TextEditingController _scrollmessageController =
      TextEditingController();

  // Title Editing Conroller for TextField for Message
  final TextEditingController _titleController = TextEditingController();

  // Cloud Function Used here to get all Scrolls
  // var url = Uri.parse('https://getscrolls-rxfc6rk7la-uc.a.run.app/');
  // Future<dynamic> _getScrolls() async {
  //   var response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     // All the data in a array(json objects), all the Scrolls
  //     var data = convert.jsonDecode(response.body);
  //     print(data.length);
  //     // Getting random JSON object with a random function
  //     // int randInt = random.nextInt(data.length);

  //     // Return random JSON object , the random Scroll
  //     // return data[randInt];
  //   } else {
  //     print('Request failed with status: ${response.statusCode}.');
  //     return {};
  //   }
  // }

  // Cloud Function used here to post a messsage to Scroll
  var urlPost = Uri.parse('https://postscroll-rxfc6rk7la-uc.a.run.app');

  Future<void> _postMessage(
      {required String message, required String title}) async {
    print('process started');
    var response =
        await http.post(urlPost, body: {'message': message, 'title': title});
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
    // _data = _getScrolls();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        // backgroundColor: Colors.grey[350],
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/write-bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 130),
                child: Container(
                  height: height / 1.5,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.orange[100],
                    border: Border.all(
                      color: Color.fromARGB(255, 191, 131, 53),
                      width: 5,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Column(
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
                        iconSize: 40,
                      ),
                      Container(
                        child: Text('Create a Scroll',
                            style: GoogleFonts.schoolbell(
                                textStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ))),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                        child: TextField(
                          controller: _titleController,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Color(0xFF1976D2), width: 3)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(191, 131, 53, 1),
                                    width: 3,
                                  )),
                              hintText: 'Title',
                              labelText: 'Title'),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: TextField(
                          controller: _scrollmessageController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 1,
                          maxLength: 500,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color(0xFF1976D2), width: 3)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(191, 131, 53, 1),
                                  width: 3,
                                )),
                            hintText: 'Enter a message',
                            labelText: 'Message',
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      Color(0xFF0D47A1),
                                      Color(0xFF1976D2),
                                      Color(0xFF42A5F5),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 40),
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                print(_scrollmessageController.text);
                                if (_scrollmessageController.text != '' &&
                                    _titleController.text != '') {
                                  _postMessage(
                                      message: _scrollmessageController.text,
                                      title: _titleController.text);
                                }

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => Home())));
                              },
                              child: const Text('POST'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
