class Video {
  String id;
  String titulo;
  String descricao;
  String imagem;
  String canal;

  Video({this.id, this.titulo, this.descricao, this.imagem, this.canal});

  /*
  static converterJson(Map<String, dynamic> json){
    return Video(
      id: json["id"]["videolId"],
      titulo: json["snippet"]["title"],
      imagem: json["snippet"]["thumbnail"]["high"]["url"],
      canal:  json["snippet"]["channelId"]
    );
  }
  */


  factory Video.fromJson(Map<String, dynamic> json){
    return Video(
        id: json["id"]["videolId"],
        titulo: json["snippet"]["title"],
        imagem: json["snippet"]["thumbnails"]["high"]["url"],
        descricao: json["snippet"]["description"],
        canal:  json["snippet"]["channelTitle"]
    );
  }
}