import 'package:flutter/material.dart';

class Snack{
  static Widget error(String text, {int duration = 1}){
    return SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
      duration: Duration(seconds: duration),
    );
  }

  static Widget success(String text, {int duration = 1}){
    return SnackBar(
      content: Text(text),
      backgroundColor: Colors.green,
      duration: Duration(seconds: duration),
    );
  }

  static Widget info(String text, {int duration = 1}){
    return SnackBar(
      content: Text(text),
      backgroundColor: Colors.grey,
      duration: Duration(seconds: duration),
    );
  }

  static Widget waring(String text, {int duration = 1}){
    return SnackBar(
      content: Text(text),
      backgroundColor: Colors.yellow,
      duration: Duration(seconds: duration),
    );
  }
}