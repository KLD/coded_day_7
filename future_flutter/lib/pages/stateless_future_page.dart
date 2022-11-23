import 'package:flutter/material.dart';
import 'package:future_flutter/util/process.dart';
import 'package:go_router/go_router.dart';

class StatelessFuturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateless"),
        actions: [
          TextButton(
              onPressed: () {
                context.go("/stateful");
              },
              child: Text("Stateful")),
          TextButton(
              onPressed: () {
                context.go("/provider");
              },
              child: Text("Provider")),
        ],
      ),
      body:
          // [Task] replace 'null' with a FutureBuilder widget.
          // Steps:
          // 1- Create future builder (optional with <String> type)
          // 2- pass 'process()' as future
          // 3- pass 'builder' the following nameless function
          // 3.a if snapshot.connectionState is ConnectionState.waiting, then return CircularProgressIndicator()
          // 3.b otherwise, return centered Text with snapshot.data
          null,
    );
  }
}
