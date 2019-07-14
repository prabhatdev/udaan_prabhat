import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Utils{
  static SnackBar getSnackBar(String message) =>
      SnackBar(content: Text(message));

  static showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
  static Widget errorScreen(Function f){
    return Center(
        child: InkWell(
            onTap: f(),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text("Hey there! Looks like our overpaid "
                  "engineers messed up!-Poor Interns\n Tap to retry"),
            )));
  }
}