import 'package:remember/state.dart';
import 'package:flutter/material.dart';
import '../actions.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:remember/utils/simpleBackground.dart';
import 'package:remember/utils/TextFieldPrimeiroAcesso.dart';
import '../utils/Avatar.dart';

typedef LoginCallback = Function(String nome);
typedef GetFotoCallback = Function();

class PrimeiroAcessoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PrimeiroAcessoPageState();
  }
}

class PrimeiroAcessoPageState extends StatefulWidget {
  @override
  PrimeiroAcessoState createState() => new PrimeiroAcessoState();
}

class PrimeiroAcessoState extends State<PrimeiroAcessoPageState> {
  String _nome = '';
  String _error;

  _onSubmit(logar) {
    if (_nome != null && _nome.length > 2) {
      logar(_nome);
      Navigator.of(context).pushReplacementNamed("/inicio");
    } else {
      setState(() {
        _error = 'Digite pelo menos 3 digitos para um nome';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginCallback>(converter: (store) {
      return (nome) => store.dispatch(Login(nome));
    }, builder: (context, logar) {
      return SimpleBackground(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text("Remember",
              style: TextStyle(
                  fontSize: 40, color: Theme.of(context).primaryColor)),
          Divider(height: 30.0, color: Colors.transparent),
          Avatar(radius: 100),
          Divider(height: 40.0, color: Colors.transparent),
          TextFieldPrimeiroAcesso(
            hintText: 'Digite seu nome',
            labelText: 'Nome',
            codePoint: 0xe261,
            autofocus: false,
            autocorrect: true,
            obscureText: false,
            onSubmitted: (txt) => _onSubmit(logar),
            error: _error,
            onChanged: (text) {
              setState(() {
                _nome = text;
              });
            },
          ),
          Divider(
              height: _error == null ? 15.0 : 2.0, color: Colors.transparent),
          RaisedButton(
              onPressed: () => _onSubmit(logar),
              child: Text(
                "Continuar",
                style: TextStyle(color: Theme.of(context).backgroundColor),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: Theme.of(context).primaryColor),
          Divider(height: 40.0, color: Colors.transparent)
        ],
      );
    });
  }
}
