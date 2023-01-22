import 'package:chatapp_firebase/shared/constast.dart';
import 'package:flutter/material.dart';

//InputDecoration for TextField
const textInputDecoration = InputDecoration(
  labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFFee7b64),
      width: 2,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFFee7b64),
      width: 2,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFFee7b64),
      width: 2,
    ),
  ),
);
// Page Route
void nextScreen(context, page) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
}

void nextScreenReplace(context, page) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (_) => page));
}

//Snackbar
void showSnackbar(context, color, message) {

  ScaffoldMessenger.of(context).showSnackBar(

     SnackBar(
      content: Text(
        message,
        style: TextStyle(
          fontSize: 14,
        ),     
      ),
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
        onPressed: (){

        },
        label:"Ok",
        textColor: Colors.white,
      ),
      backgroundColor: color,
      ),
  );
}
