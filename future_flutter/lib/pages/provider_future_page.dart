import 'package:flutter/material.dart';
import 'package:future_flutter/providers/process_provider.dart';
import 'package:future_flutter/util/process.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProviderFuturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        actions: [
          TextButton(
              onPressed: () {
                context.go("/stateless");
              },
              child: Text("Stateless")),
          TextButton(
              onPressed: () {
                context.go("/statful");
              },
              child: Text("Stateful")),
        ],
      ),
      body:

          /// [Task 6] build widget similar to stateful_future_page.dart
          /// Steps:
          /// 1- watch 'isLoading' , when it's true, build CircularProgressIndicator
          /// 2- when isLoading is false, build a Button and Text
          /// 3- Build a Text widget and pass it 'status' from ProcessProvider
          /// 4- Make Button call 'startProcess' from ProcessProvider
          null,
    );
  }
}
