import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
     IconButton(
       icon: Icon(Icons.clear),
       onPressed: (){
         query = "";
       },
     ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        close(context, "flutter");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //print("Resultado: Pesquisa esta sendo realizada");
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //print("Resultado: digitado " + query);
    List<String> lista = List();

    if(query.isNotEmpty){
      lista = [
        "Flutter", "Android", "Flutter Widget", "IOS", "Jogos"
      ].where(
          (texto) => texto.toLowerCase().startsWith(query.toLowerCase())
      ).toList();
      
      return ListView.builder(
        itemCount: lista.length,
          itemBuilder: (context, index){
            return ListTile(
              onTap: (){
                close(context, lista[index]);
              },
              title: Text(lista[index]),
            );
          }
      );
    }else{
      return Center(
        child: Text("Nenhum resultado"),
      );
    }
  }
}