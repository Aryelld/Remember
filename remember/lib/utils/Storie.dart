import 'dart:io';

import 'package:flutter/material.dart';
import '../utils/Avatar.dart';

class Stories extends StatelessWidget {
  Stories(
      {this.fotos,
      this.time,
      this.percent,
      this.onTapTime,
      this.onTapNoPhoto,
      this.avatarTag,
      this.showAvatar,
      this.onTapAdd});

  final List<dynamic> fotos;
  final String time;
  final String avatarTag;
  final double percent;
  final Function onTapTime;
  final Function onTapNoPhoto;
  final Function onTapAdd;
  final bool showAvatar;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: 12.0, bottom: 12.0),
      height: height * percent,
      width: width * percent,
      child: Container(
        margin: EdgeInsets.all(20),
        height: height * percent * 0.2,
        // width: width * percent * 0.2,
        child: Column(
          children: <Widget>[
            Row(
              children: 
                showAvatar ? <Widget>[
                Avatar(
                  radius: 20.0,
                  tag: avatarTag,
                ),
                InkWell(
                  child: Text(
                    "  " + time,
                    style: TextStyle(
                        fontSize: 22, color: Theme.of(context).backgroundColor),
                  ),
                  onTap: onTapTime,
                ),
              ]: <Widget>[
                InkWell(
                  child: Text(
                    "  " + time,
                    style: TextStyle(
                        fontSize: 37, color: Theme.of(context).backgroundColor),
                  ),
                  onTap: onTapTime,
                ),
              ],
            ),
            this.onTapAdd != null?
            Container(
              height: height*percent*0.8,
              width: width*percent*0.8,
              child: Center(
                child: FloatingActionButton(
                  backgroundColor: Theme.of(context).backgroundColor,
                  child: Icon(const IconData(57669, fontFamily: 'MaterialIcons'), color: Colors.black),
                  onPressed: onTapAdd,
                ),
              )
            ):Container(
              height: height*percent*0.8,
              width: width*percent*0.8,
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
          image: this.fotos != null
              ? DecorationImage(
                  image: FileImage(File(this.fotos[0])),
                  fit: BoxFit.cover,
                )
              : null,
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(20.0)),
    );
  }
}
