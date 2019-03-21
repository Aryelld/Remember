import 'actions.dart';
import 'state.dart';

AppState reducer(AppState prev, dynamic action){
  if(action is Login){
    prev.foto =action.foto;
    prev.nome =action.nome;
    prev.primeiroAcesso = false;
  }
  print(prev.stories);
  return prev;
}
