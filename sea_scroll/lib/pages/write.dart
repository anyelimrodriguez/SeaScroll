import "package:flutter/material.dart";
import 'package:sea_scroll/pages/home.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:math';

class Write extends StatefulWidget {
  const Write({super.key});

  @override
  State<Write> createState() => _WriteState();
}

class _WriteState extends State<Write> {
  // Random button
  final random= Random();

  // Message Editing Conroller for TextField for Message
  final TextEditingController _messageController=TextEditingController();

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
      var data=convert.jsonDecode(response.body);
      print(data.length);
      // Getting random JSON object with a random function 
      int randInt=random.nextInt(data.length);

      // Return random JSON object , the random Scroll
      return data[randInt]; 

    } else {
      print('Request failed with status: ${response.statusCode}.');
      return {};
    }
  }

  // Cloud Function used here to post a messsage to Scroll
  var urlPost = Uri.parse('https://postmessage-rxfc6rk7la-uc.a.run.app/');

  Future<void> _postMessage({required String message, required String id}) async {
    print('process started');
    var response=await http.post(urlPost, body: {'message': message, 'id': id});
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
    _data=_getScrolls();
  }

  @override
  Widget build(BuildContext context) {

    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/write-bg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset : false,
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget> [
            SizedBox(height: height/4, width:width/4),
            FutureBuilder<dynamic>(
              future: _data,
              builder: (context, AsyncSnapshot<dynamic> snap) {
                  if (snap.hasData) {
                    return Column(
                      children: [
                        Container(
                          height: height/3,
                          width: width/2,
                          child: ListView.builder(  itemCount: snap.data!['messages'].length,
                          itemBuilder: (context, index) {
                            print(snap.data!);
                            return Row(
                              children: <Widget>[
                                Container(
                                  child: CircleAvatar(
                                    backgroundColor: colors[random.nextInt(colors.length)],
                                    //child: Image.network('https://ia801703.us.archive.org/6/items/twitter-default-pfp/e.png'),
                                    radius: height/20,
                                  ),
                                  
                                ),
                                Text(snap.data!['messages'][index]),
                                
                              ],
                            );
                          }),
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(height: height/11, width:width/5),
                            Container(
                              height: height/2,
                              width: width/2,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(20),
                              child: TextField(
                                decoration: InputDecoration(hintText: "Enter Message"),
                                controller: _messageController,  
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                  print(snap.data!["scrollid"]);
                                  print(_messageController.text);
                                  _postMessage(message: _messageController.text, id: (snap.data!["scrollid"].toString()) );
                                  Navigator.push(context,MaterialPageRoute(builder: ((context) => Home())));
                              },
                              child: Text('Sub'),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                  else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      ); 
                  }
              }                
            ),
            
          ],
        ),
      ),
      
    );
  }
}