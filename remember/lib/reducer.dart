import 'actions.dart';
import 'state.dart';

AppState reducer(AppState prev, dynamic action){
  if(action is Login){
    prev.nome =action.nome;
    prev.primeiroAcesso = false;
  }else if(action is SetFoto){
    prev.foto = action.foto;
  }else if(action is AddStorie){
    if(prev.stories[action.horario] == null){
      prev.stories[action.horario] = List<dynamic>();
    }
    prev.stories[action.horario].addAll(action.fotos);
  }

  print(prev.stories);
  return prev;
}
