import 'dart:io';

import 'package:remember/utils/Storie.dart';
import '../actions.dart';
import './inicialPage.dart';
import 'package:remember/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:remember/utils/simpleBackground.dart';
import 'package:image_picker_modern/image_picker_modern.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

typedef AddStorieCalllback = Function(List<dynamic> fotos, String horario);

class AdicionaStoriePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdicionaStoriePageState();
  }
}

class AdicionaStoriePageState extends StatefulWidget {
  @override
  AdicionaStorieState createState() => new AdicionaStorieState();
}

class AdicionaStorieState extends State<AdicionaStoriePageState> {
  TimeOfDay _selectedDate = TimeOfDay.now();
  List<dynamic> _fotos;

  @override
  Widget build(BuildContext context) {

    return SimpleBackground(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Divider(height: 60, color: Colors.transparent),
         Flexible(
            fit: FlexFit.tight,
            child: Stories(
            percent: 0.88,
            fotos: _fotos,
            showAvatar: true,
            time: _selectedDate.format(context),
            onTapAdd: () async {
              var foto = await ImagePicker.pickImage(source: ImageSource.gallery);
              if(foto != null){
                setState(() {
                  if(_fotos == null){
                    _fotos = List<dynamic>();
                  }
                  _fotos.add(foto.path);
                });  
              }
            },
            onTapTime: (){
              showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                builder: (BuildContext context, Widget child) {
                  return Theme(
                    data: Theme.of(context),
                    child: child,
                  );
                },
              ).then(
                (time){
                  if(time != null){
                    setState((){
                      _selectedDate = time;
                    });
                  }
                }
              );
            },
            onTapNoPhoto: () async {
              var images = [];
              for (File foto in images) {
                setState(() {
                  _fotos = [foto.path];             
                });
              }
            },   
          ),
        ),
        StoreConnector<AppState, AddStorieCalllback>(converter: (store) {
          return (fotos, horario) => store.dispatch(AddStorie(fotos,horario));
        }, builder: (context, addStorie) {
          return RaisedButton(
            shape: StadiumBorder(),
            color: Theme.of(context).primaryColor,
            child: Text("Continuar",
              style: TextStyle(
                color: Theme.of(context).backgroundColor
              ),
            ),
            onPressed: () async {
              if(_fotos != null && _fotos.length > 0){
                addStorie(_fotos, _selectedDate.format(context));
                FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
                var initializationSettingsAndroid =
                    new AndroidInitializationSettings('app_icon');
                var initializationSettingsIOS = new IOSInitializationSettings();
                var initializationSettings = new InitializationSettings(
                  initializationSettingsAndroid, initializationSettingsIOS);
                flutterLocalNotificationsPlugin.initialize(initializationSettings,
                    onSelectNotification: onSelectNotification);
                var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
                  'your channel id', 'your channel name', 'your channel description',
                  importance: Importance.Max, priority: Priority.High);
                var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
                var platformChannelSpecifics = new NotificationDetails(
                  androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
                await flutterLocalNotificationsPlugin.show(
                  0, 'plain title', 'plain body', platformChannelSpecifics,
                  payload: 'item id 2');
                Navigator.of(context).pop();
              }
            },
          );
        }),
        Divider(height: 20, color: Colors.transparent),
      ],
    );
  }

  Future onSelectNotification(String payload) async {
    await Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new InicialPage()),
    );
  }
}