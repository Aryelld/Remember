import 'actions.dart';
import 'state.dart';

AppState reducer(AppState prev, dynamic action){
  if(action is Login){
    prev.nome =action.nome;
    prev.primeiroAcesso = false;
  }else if(action is SetFoto){
    prev.foto = action.foto;
  }
  print(prev.toString());
  return prev;
}
