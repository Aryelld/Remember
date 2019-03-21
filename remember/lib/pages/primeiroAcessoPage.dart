import 'dart:io';

import 'package:remember/state.dart';
import 'package:flutter/material.dart';
import '../actions.dart';
import 'package:image_picker_modern/image_picker_modern.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:remember/utils/simpleBackground.dart';
import 'package:remember/utils/TextFieldPrimeiroAcesso.dart';

typedef LoginCallback = Function(File foto, String nome);
typedef GetFotoCallback = Function();

class PrimeiroAcessoPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return PrimeiroAcessoPageState();
  }
}

class PrimeiroAcessoPageState extends StatefulWidget{
  @override
  PrimeiroAcessoState createState() => new PrimeiroAcessoState();
}

class PrimeiroAcessoState extends State<PrimeiroAcessoPageState> {
  File _foto;
  String _nome = '';
  String _error;
  
  Future getImage() async {
    var foto = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _foto = foto;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SimpleBackground(
          children: <Widget>[ 
            Text("Remember", 
              style: TextStyle(
                fontSize: 40,
                color: Theme.of(context).primaryColor
              )
            ),
            Divider(height: 30.0, color: Colors.transparent),
            CircleAvatar(
              radius: 100.0,
              backgroundImage: _foto == null ? null : FileImage(_foto),
              backgroundColor: Theme.of(context).primaryColor,
              child: Material(                
                color: Colors.transparent,
                child: InkWell(
                  highlightColor: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  onTap: getImage,   
                  child: _foto == null ? Icon(IconData(59391, fontFamily: 'MaterialIcons'), size: 200, color: Theme.of(context).backgroundColor) : null               
                )
              )
            ),
            Divider(height: 40.0, color: Colors.transparent),
            TextFieldPrimeiroAcesso(
              hintText: 'Digite seu nome',
              labelText: 'Nome',
              codePoint: 0xe261,
              autofocus: false,
              autocorrect: true,
              obscureText: false,
              error: _error,
              onChanged: (text){
                setState(() {
                  _nome = text;
                });
              },
            ),
            Divider(height: _error == null ? 15.0 : 3.0 , color: Colors.transparent),
            StoreConnector<AppState, LoginCallback>(
              converter: (store){
                return (foto, nome) => store.dispatch(Login(foto, nome));
              },
              builder: (context, logar){
                return RaisedButton(
                  onPressed: (){
                    if(_nome.length < 3){
                      setState(() {
                       _error = "O campo deve ter pelo menos 3 caracteres"; 
                      });
                    }else{
                      logar(_foto, _nome);
                      Navigator.of(context).pushReplacementNamed("/inicio"); 
                    }
                  },
                  child: Text(
                    "Continuar",
                    style: TextStyle(
                      color: Theme.of(context).backgroundColor
                    ),
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  color: Theme.of(context).primaryColor
                );
              }
            ),
            Divider(height: 40.0, color: Colors.transparent)
          ],
        );
  }
}
