import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:math';
import 'package:sea_scroll/pages/home.dart';
import 'package:sea_scroll/pages/write.dart';

class RandomScroll extends StatefulWidget {
  const RandomScroll({super.key});

  @override
  State<RandomScroll> createState() => _RandomScrollState();
}

class _RandomScrollState extends State<RandomScroll> {
// Random button
  final random = Random();

  var url = Uri.parse('https://getscrolls-rxfc6rk7la-uc.a.run.app/');
  Future<List<dynamic>> _getAllScrolls() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // All the data in a array(json objects), all the Scrolls
      var data = convert.jsonDecode(response.body);
      // Return random JSON object , the random Scroll
      data.shuffle();
      return data;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return [{}];
    }
  }

  Future<List>? _data;

  @override
  void initState() {
    super.initState();
    _data = _getAllScrolls();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/under-the-sea.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder<List<dynamic>>(
          future: _data,
          builder: (context, AsyncSnapshot<List<dynamic>> snap) {
            if (snap.hasData) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 30),
                    itemCount: min(snap.data!.length, 20),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          var scrollid = snap.data![index]['scrollid'];
                          var title = snap.data![index]['title'];
                          var messages = snap.data![index]['messages'];

                          print('Bottle: ');
                          print(snap.data![index]);

                          Navigator.push(context, MaterialPageRoute(builder: ((context) => Write(scrollid: scrollid, title: title, messages: messages))));
                        },
                        child: Container(
                            decoration: BoxDecoration(image: DecorationImage(
                                image: AssetImage('assets/bottle.png')))),
                      );
                    }),
              );
            }
            else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: ((context) => Home()),),);},
              icon: Icon(Icons.arrow_back),
              iconSize: 50,
            ),
            FutureBuilder<List<dynamic>>(
              future: _data,
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                return Container(
                  width: width/2,
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      int randInt = random.nextInt(snapshot.data!.length);

                      print('Bottle: ');
                      print(snapshot.data![randInt]);

                      var scrollid = snapshot.data![randInt]['scrollid'];
                      var title = snapshot.data![randInt]['title'];
                      var messages = snapshot.data![randInt]['messages'];
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => Write(scrollid: scrollid, title: title, messages: messages)),),);
                      },
                    label: Text('Random'),
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}