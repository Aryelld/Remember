import 'package:remember/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:remember/utils/simpleBackground.dart';
import '../utils/Avatar.dart';

typedef GetNomeCallback = Function();

class InicialPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SimpleBackground(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: <Widget>[
              Avatar(radius: 18),
              StoreConnector<AppState, GetNomeCallback>(
                converter: (store){
                  return () => store.state.nome;
                },
                builder: (context, getNome){
                  return Text(' '+ getNome(),
                    style: TextStyle(
                      fontSize: 18
                    ),
                  );
                }
              )
            ]
          )
        ),
        Container(
          alignment: new Alignment(1, 1),
          child: 
          FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(const IconData(57669, fontFamily: 'MaterialIcons')),
            onPressed: (){}
          )
        )
      ],
    );
  }
}
