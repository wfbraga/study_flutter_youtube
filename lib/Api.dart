import 'package:flutter_youtub_app/model/Video.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const CHAVE_YOUTUBE_API = "AIzaSyBH7kF00GEhbuWgWZ2gND24H0USt1vhc8A";
const ID_CANAL = "UCwXdFgeE9KYzlDdR7TG9cMw";
const URL_BASE = "https://www.googleapis.com/youtube/v3";

class Api {

  Future<List<Video>> pesquisar ( String pesquisa ) async {
    http.Response response = await http.get(
      URL_BASE + "/search"
          "?part=snippet"
          //"&channelId=$ID_CANAL"
          "&type=video"
          "&maxResults=20"
          "&order=date"
          "&key=$CHAVE_YOUTUBE_API"
          "&q=$pesquisa"
    );
    if(response.statusCode ==200){

      Map<String, dynamic> dadosJason = json.decode( response.body );

      List<Video> videos = dadosJason["items"].map<Video>(
          (map){
            return Video.fromJson(map);
            // retunr Video.converterJdon(map) -> para efeito de aprendizagem este codigo esta ligado ao que esta comentado em Video.dart
          }
      ).toList();

      return videos;

      /*
      for (var video in dadosJason["items"]){

        print("Resultado: " + video.toString());
      }
      print("Resposta: "  + dadosJason["items"][1]["snippet"]["title"].toString() );
      */

    }else{
     print("erro" + response.body);
    }
  }
}