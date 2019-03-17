class AppState{
  String nome;
  String foto;
  bool primeiroAcesso;
  List<String> stories;

  AppState(this.nome, this.foto, this.primeiroAcesso ,this.stories);

  static AppState fromJson(dynamic json) {
    if(json == null){
      return AppState('','', true, <String>[]);
    }else{
      return AppState(
        json["nome"], 
        json["foto"], 
        json["primeiroAcesso"],
        json["stories"]  
      );
    }
  } 

  dynamic toJson() => {'nome': nome, 'foto': foto, 'primeiroAcesso': primeiroAcesso, 'stories': stories};
}