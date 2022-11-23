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
      body: context.watch<ProcessProvider>().isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(child: Text(context.watch<ProcessProvider>().status)),
                ElevatedButton(
                  onPressed: () {
                    context.read<ProcessProvider>().startProcess();
                  },
                  child: Text("Loading"),
                ),
              ],
            ),
    );
  }
}
