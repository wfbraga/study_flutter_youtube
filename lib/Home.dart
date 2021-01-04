import 'package:flutter/material.dart';
import 'package:flutter_youtub_app/telas/Biblioteca.dart';
import 'package:flutter_youtub_app/telas/EmAlta.dart';
import 'package:flutter_youtub_app/telas/Inicio.dart';
import 'package:flutter_youtub_app/telas/Inscricao.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(),
      EmAlta(),
      Biblioteca(),
      Inscricao()
    ];

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

      body:
      telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              //backgroundColor: Colors.orange,
                title: Text("Inicio"),
                icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
                //backgroundColor: Colors.green,
                title: Text("Em Alta"),
                icon: Icon(Icons.whatshot)
            ),
            BottomNavigationBarItem(
                //backgroundColor: Colors.blue,
                title: Text("Inscricoes"),
                icon: Icon(Icons.subscriptions)
            ),
            BottomNavigationBarItem(
                //backgroundColor: Colors.yellow,
                title: Text("Biblioteca"),
                icon: Icon(Icons.library_add)
            ),
          ]),
    );
  }
}
