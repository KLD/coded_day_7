import 'package:flutter/material.dart';
import 'package:future_flutter/util/process.dart';
import 'package:go_router/go_router.dart';

class StatefulFuturePage extends StatefulWidget {
  @override
  State<StatefulFuturePage> createState() => _StatefulFuturePageState();
}

class _StatefulFuturePageState extends State<StatefulFuturePage> {
  late bool isLoading;
  String processResult = "";

  @override
  void initState() {
    super.initState();
    isLoading = true;

    process().then((value) => setState(() {
          setState(() {
            isLoading = false;
            processResult = value;
          });
        }));
  }

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
            onPressed: isLoading
                ? null
                : () async {
                    setState(() {
                      isLoading = true;
                    });
                    var result = await process();

                    setState(() {
                      isLoading = false;
                      processResult = result;
                    });
                  },
            child: Text("Load process"),
          ),
        ],
      ),
    );
  }
}
