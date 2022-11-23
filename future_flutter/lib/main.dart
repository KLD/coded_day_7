import 'package:flutter/material.dart';
import 'package:future_flutter/pages/provider_future_page.dart';
import 'package:future_flutter/pages/stateless_future_page.dart';
import 'package:future_flutter/pages/stateful_future_page.dart';
import 'package:future_flutter/providers/process_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

final router = GoRouter(
  initialLocation: '/stateless',
  routes: [
    GoRoute(
      path: '/stateless',
      builder: (context, state) => StatelessFuturePage(),
    ),
    GoRoute(
      path: '/stateful',
      builder: (context, state) => StatefulFuturePage(),
    ),
    GoRoute(
      path: '/provider',
      builder: (context, state) => ProviderFuturePage(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProcessProvider(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.blue,
            ),
          ),
        ),
        routerConfig: router,
      ),
    );
  }
}
