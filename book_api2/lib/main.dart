import 'package:book_api/pages/add_book.dart';
import 'package:book_api/pages/book_list_page.dart';
import 'package:book_api/provider/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => BookListPage(),
  ),
  GoRoute(
    path: '/add_book',
    builder: (context, state) => AddBookPage(),
  ),
]);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BookProvider(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
          errorColor: Colors.red,
        ),
        routerConfig: router,
      ),
    );
  }
}
