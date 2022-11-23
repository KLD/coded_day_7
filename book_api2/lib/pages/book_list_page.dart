import 'package:book_api/provider/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../widgets/book_card.dart';

class BookListPage extends StatelessWidget {
  const BookListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book List')),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push('/add_book');
          },
          child: const Icon(Icons.add)),
      body: context.watch<BookProvider>().isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: context.read<BookProvider>().loadBooks,
              child: ListView.builder(
                itemCount: context.watch<BookProvider>().books.length,
                itemBuilder: (context, index) {
                  var book = context.watch<BookProvider>().books[index];
                  return BookCard(book);
                },
              ),
            ),
    );
  }
}
