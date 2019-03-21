import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldPrimeiroAcesso extends StatelessWidget{

  TextFieldPrimeiroAcesso({
    this.focus,
    this.onChanged,
    this.onSubmitted,
    this.autocorrect,
    this.obscureText,
    this.autofocus,
    this.codePoint,
    this.hintText,
    this.labelText,
    this.error
  });
  
  final String error;
  final String hintText;
  final String labelText;  
  final int codePoint;
  final bool autofocus;
  final FocusNode focus;
  final bool obscureText;
  final bool autocorrect;
  final Function onChanged;
  final Function onSubmitted;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10,5,10,5),
      child: TextField(
        focusNode: focus,
        cursorColor: Theme.of(context).primaryColor == Colors.white ? Colors.black : Theme.of(context).primaryColor,
        onChanged: onChanged,   
        onSubmitted: onSubmitted,
        autofocus: this.autofocus,
        obscureText: this.obscureText,
        textCapitalization: TextCapitalization.words,
        autocorrect: this.autocorrect,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          errorText: error,
          filled: true,
          hintText: this.hintText,
          labelText: this.labelText,
          fillColor: Colors.white,
          prefixIcon: Icon(IconData(codePoint, fontFamily: 'MaterialIcons')),
          contentPadding: EdgeInsets.fromLTRB(15, 13, 15, 13),
          hasFloatingPlaceholder: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Theme.of(context).primaryColor == Colors.white ? Colors.black : Theme.of(context).primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.redAccent),
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.redAccent),
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
        ),
      ),
    ); 
  }
}