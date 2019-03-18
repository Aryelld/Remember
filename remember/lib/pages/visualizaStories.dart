import 'package:flutter/material.dart';
import 'package:remember/utils/simpleBackground.dart';


class VisualizaStoriesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SimpleBackground(
      children: <Widget>[
        Container(
            child: Column(
              children: <Widget>[
                Text('oiiiii'),
                RaisedButton(
                  child: Text('voltar'),
                  onPressed: (){Navigator.pop(context);},
                )
              ],
            )
        )
      ],
    );
  }
}
