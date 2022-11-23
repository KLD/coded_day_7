import 'package:flutter/material.dart';
import 'package:future_flutter/util/process.dart';

class ProcessProvider extends ChangeNotifier {
  String status = "";
  bool isLoading = true;

  /// [Task 4] call 'startProcess' when ProcessProvider is created
  /// Steps:
  /// 1- Create a constructor
  /// 2- call 'startProcess' inside the constructor

  /// [Task 5] loads process and updates status
  /// Steps:
  /// 1- set 'isLoading' to true and notify listeners
  /// 2- call 'process()' and store the result in a variable
  /// 3- set 'status' to the result and set 'isLoading' to false & notify listeners
  void startProcess() {}
}
