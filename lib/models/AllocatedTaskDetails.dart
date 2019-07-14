import 'package:flutter/material.dart';

class AllocatedTasksDetails with ChangeNotifier {
  String taskId = "", assetId = "", workerId = "";
  int days=0;

  set task(String t) {
    taskId = t;
    notifyListeners();
  }

  set asset(String a) {
    assetId = a;
    notifyListeners();
  }

  set worker(String w) {
    workerId = w;
    notifyListeners();
  }
  set dayss(int d){
    days=d;
    notifyListeners();
  }
}
