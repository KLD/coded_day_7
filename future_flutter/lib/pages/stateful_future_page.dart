import 'package:flutter/material.dart';
import 'package:future_flutter/util/process.dart';
import 'package:go_router/go_router.dart';

class StatefulFuturePage extends StatefulWidget {
  @override
  State<StatefulFuturePage> createState() => _StatefulFuturePageState();
}

class _StatefulFuturePageState extends State<StatefulFuturePage> {
  bool isLoading = true;
  String processResult = "";

  // [Task 2] Loading inital processResult using initState
  // Steps:
  // 1- override initState
  // 2- call 'process()'
  // 3- add 'then' to process's future
  // 4- inside then, set 'processResult' to the result and set isLoading to false

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful"),
        actions: [
          TextButton(
              onPressed: () {
                context.go("/stateless");
              },
              child: Text("Stateless")),
          TextButton(
              onPressed: () {
                context.go("/provider");
              },
              child: Text("Provider")),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (isLoading)
            Center(child: CircularProgressIndicator())
          else
            Center(child: Text(processResult)),
          ElevatedButton(
            // [Task 3] Loading process when button is pressed
            // 1- replace 'null' with an async nameless method
            // 2- set isLoading to true
            // 3- call 'await process()' and store the result in a variable;
            // 4- set 'processResult' to the result and set isLoading to false
            // 5- [optional] when 'isLoading' is true, disable button
            onPressed: null,

            child: Text("Load process"),
          ),
        ],
      ),
    );
  }
}
