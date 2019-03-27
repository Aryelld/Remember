import 'package:remember/state.dart';
import 'package:remember/actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:image_picker_modern/image_picker_modern.dart';
import 'dart:io';

typedef GetFotoCallback = Function();
typedef SetFotoCallback = Function(String foto);

class Avatar extends StatelessWidget{

  Avatar({
    this.radius,
  });
  
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'avatar',
      child: StoreConnector<AppState, GetFotoCallback>(
        converter: (store){
          return () => store.state.foto;
        },
        builder: (context, getFoto){
          String foto = getFoto();
          return CircleAvatar(
            radius: radius,
            backgroundImage: foto == '' ? null : FileImage(File(foto)),
            backgroundColor: Theme.of(context).primaryColor,
            child: Material(                
              color: Colors.transparent,
              child: StoreConnector<AppState, SetFotoCallback>(
                converter: (store){
                  return (foto) => store.dispatch(SetFoto(foto));
                },
                builder: (context, setFoto){
                  return InkWell(
                    highlightColor: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(radius)),
                    onTap:  () async {
                      var foto = await ImagePicker.pickImage(source: ImageSource.gallery);
                      setFoto(foto.path);
                    },   
                    child: foto == '' ? Icon(IconData(59391, fontFamily: 'MaterialIcons'), size: radius*2, color: Theme.of(context).backgroundColor) : null               
                  );
                }
              )
            )
          );
        }
      )
    );
  }
}