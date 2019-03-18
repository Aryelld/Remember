import 'package:flutter/material.dart';
import 'package:remember/utils/simpleBackground.dart';
import 'package:remember/utils/TextFieldPrimeiroAcesso.dart';

class PrimeiroAcessoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SimpleBackground(
      children: <Widget>[
        TextFieldPrimeiroAcesso(
          hintText: 'Digite seu nome',
          codePoint: 0xe261,
          autofocus: false,
          autocorrect: true,
          obscureText: false
        ),
        Divider(height: 5.0, color: Colors.transparent),
        RaisedButton(
          onPressed: (){Navigator.pushNamed(context,'/visualizaStories');},
          child: Text(
            "Continuar",
            style: TextStyle(
              color: Colors.white
            ),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: Theme.of(context).primaryColor
        ),
        Divider(height: 15.0, color: Colors.transparent)
      ],
    );
  }
}
