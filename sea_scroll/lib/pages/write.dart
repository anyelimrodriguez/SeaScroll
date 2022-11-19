import "package:flutter/material.dart";

class Write extends StatefulWidget {
  const Write({super.key});

  @override
  State<Write> createState() => _WriteState();
}

class _WriteState extends State<Write> {

  @override
  Widget build(BuildContext context) {

    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/scroll-bg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget> [
            SizedBox(height: height/4, width:width/4),
            Row(
              children: <Widget>[
                SizedBox(height: height/11, width:width/5),
                Container(
                  height: height/2,
                  width: width/2,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    decoration: InputDecoration(hintText: "Message"),  
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      
    );
  }
}