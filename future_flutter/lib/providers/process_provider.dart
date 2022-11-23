import 'package:flutter/material.dart';
import 'package:future_flutter/util/process.dart';

class ProcessProvider extends ChangeNotifier {
  String status = "";
  bool isLoading = true;

  ProcessProvider() {
    startProcess();
  }

  void startProcess() async {
    isLoading = true;
    notifyListeners();

    var result = await process();

    status = result;
    isLoading = false;
    notifyListeners();
  }
}
