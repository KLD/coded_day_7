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
      body: FutureBuilder<String>(
          future: process(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            String data = snapshot.data!;

            return Center(child: Text(data));
          }),
    );
  }
}
