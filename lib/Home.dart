import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme:  IconThemeData(
          color: Colors.grey,
        ),
        title: Image.asset(
            "imagens/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.videocam),
              onPressed: (){
                print("Action Videocam");
              }
          ),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                print("Action search");
              }
          ),
          IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: (){
                print("Action Login");
              }
          )
        ],
      ),

      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(
                title: Text("Inicio"),
                icon: Icon(Icons.home)
            ),
            BottomNavigationBarItem(
                title: Text("Em Alta"),
                icon: Icon(Icons.whatshot)
            ),
            BottomNavigationBarItem(
                title: Text("Inicio"),
                icon: Icon(Icons.home)
            ),
          ]),
    );
  }
}
