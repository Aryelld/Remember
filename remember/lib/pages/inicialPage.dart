import 'package:remember/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:remember/utils/Storie.dart';
import 'package:remember/utils/simpleBackground.dart';
import '../utils/Avatar.dart';

typedef GetNomeCallback = Function();
typedef GetStoriesCallback = Function();

class InicialPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SimpleBackground(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left:20.0, top: 27.5),
          child: Row(
            children: <Widget>[
              Avatar(radius: 18),
              StoreConnector<AppState, GetNomeCallback>(
                converter: (store){
                  return () => store.state.nome;
                },
                builder: (context, getNome){
                  return Text('  '+getNome(),
                    style: TextStyle(
                      fontSize: 18
                    ),
                  );
                }
              )
            ]
          )
        ),
        StoreConnector<AppState, GetStoriesCallback>(
          converter: (store){
            return () => store.state.stories;
          },
          builder: (context, getStories){
            Map<String, dynamic> stories = getStories();
            return Flexible(
              fit: FlexFit.tight,
              child: ListView.builder(
                itemBuilder: (_, int index) {
                  return Material(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 26),
                      child: Stories(
                        percent: 0.88,
                        showAvatar: false,
                        avatarTag: 'avatar' + stories.keys.toList()[index],
                        fotos: stories.values.toList()[index],
                        time: stories.keys.toList()[index]
                      ),
                    )
                  );
                },
                itemCount: stories.values.toList().length,
                scrollDirection: Axis.horizontal,
              ),
            );
          }
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: 
          Container(

            margin: EdgeInsets.only(bottom: 12.5, right: 11.0),
            alignment: new Alignment(1, 1 ),
            child: 
            FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(const IconData(57669, fontFamily: 'MaterialIcons')),
              onPressed: (){
                Navigator.of(context).pushNamed("/addStorie");
              }
            )
          )
        )
      ],
    );
  }
}
