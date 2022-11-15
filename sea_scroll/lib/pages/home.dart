// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/back-btn.dart';
import '../components/elevated-box-decoration.dart';
import '../components/fetch-msg-btn.dart';
import '../components/montStyle.dart';
import '../components/schoolStyle.dart';
import 'package:postgres/postgres.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  // final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var connection = PostgreSQLConnection("10.0.2.2", 5432, "postgres", username: "postgres", password: "V:EHT]3&R;BP5sQQ");

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
          child: Expanded(
            child: Column(
              children: [
                // SizedBox(
                //   height: height / 40,
                // ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    schoolStyle('Welcome to'),
                    Image(
                        image: const AssetImage('assets/ss-logo.png'),
                        height: height / 9),
                  ],
                )),
                SizedBox(
                  height: height / 30,
                ),
                Container(
                    height: height / 2,
                    width: 400,
                    decoration: BoxDecoration(
                        // color: Colors.amber,
                        border: Border(
                      top: BorderSide(width: 2),
                      bottom: BorderSide(width: 2),
                    )),
                    child: SingleChildScrollView(
                      child: FutureBuilder<dynamic>(
                        future: connection.open(),
                        builder: (context, AsyncSnapshot<dynamic> snapshot) {
                          return FutureBuilder<List<dynamic>>(
                                future: connection.query("SELECT * FROM users"),
                                builder: (context, AsyncSnapshot<List<dynamic>> snap) {
                                  print(connection.isClosed);
                                  if(snap.hasData) {
                                    print(snap.data![0]);
                                  //return Expanded(
                                    // child: Column(
                                    //   children: snap.data!.map((row) => Text(row[1], style: TextStyle(color: Colors.blue, letterSpacing: 0.5, decoration: TextDecoration.none, fontFamily: 'Roboto'),)).toList(),
                                    // ),
                                    return Container(
                                        height: 300,
                                        child: ListView.builder(
                                          itemCount: snap.data!.length,
                                          itemBuilder: (context, index) {
                                            print(snap.data!.length);
                                            return GestureDetector(
                                                onTap: () {
                                                  var pfplink;
                                                  if(snap.data![index][3] == null)
                                                  {pfplink = 'https://ia801703.us.archive.org/6/items/twitter-default-pfp/e.png';}
                                                  else {pfplink = snap.data![index][3].toString();}
                                              _showFullModal(context, snap.data![index][1].toString(), snap.data![index][2].toString(), pfplink);
                                            },
                                            child: Container(
                                                child: Text(snap.data![index][1].toString())
                                            )
                                            );
                                          },
                                        )
                                    );
                                  }
                                  else {
                                    return Center( child: CircularProgressIndicator());
                                  }
                                }
                              );
                        }
                      ),
                    )),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buttonB(context, height / 9),
                    buttonF(context, height / 9),
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}

_showFullModal(context, String name, String bio, String pfpLink) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false, // should dialog be dismissed when tapped outside
    barrierLabel: "Modal", // label for barrier
    transitionDuration: Duration(milliseconds: 500), // how long it takes to popup dialog after button click
    pageBuilder: (_, __, ___) { // your widget implementation
      return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
                onPressed: (){
                  Navigator.pop(context);
                }
            ),
            title: Text(
              name,
              style: TextStyle(color: Colors.black87, fontFamily: 'Overpass', fontSize: 20),
            ),
            elevation: 0.0
        ),
        backgroundColor: Colors.white.withOpacity(0.90),
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: const Color(0xfff8f8f8),
                width: 1,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                    text: bio,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black,
                        wordSpacing: 1
                    )
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(pfpLink),
            ],
          ),
        ),
      );
    },
  );
}
