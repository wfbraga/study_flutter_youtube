import 'package:flutter/material.dart';
import 'package:flutter_youtub_app/Api.dart';
import 'package:flutter_youtub_app/model/Video.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {

    _listarVideos(){
      Api api = Api();
      return api.pesquisar("flutter");
    }

    return FutureBuilder< List < Video > >(
      future: _listarVideos(),
      builder: (contex, snapshot){
        switch( snapshot.connectionState ){
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if(snapshot.hasData){

              return ListView.separated(
                  itemBuilder: (context, index){
                    List<Video> videos = snapshot.data;

                    Video video = videos[index];

                    return Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                                image: NetworkImage(video.imagem)
                            )
                          ),
                        ),
                        ListTile(
                          title: Text(video.titulo),
                          subtitle: Text(video.canal),
                        )
                      ],
                    );

                  },
                  separatorBuilder: (context, index) => Divider(
                    height: 2,
                    color: Colors.red,
                  ),
                  itemCount: snapshot.data.length
              );

            }else{
              return Center(
                child: Text("Nenhum dado a ser exibido"),
              );
            }
            break;
        }
      },
    );
  }
}
