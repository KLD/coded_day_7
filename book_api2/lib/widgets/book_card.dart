import 'package:book_api/models/book_model.dart';
import 'package:book_api/provider/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BookCard extends StatelessWidget {
  BookCard(this.book);

  final Book book;

  @override
  Widget build(BuildContext context) => ListTile(
        leading: Image.network(book.image),
        title: Text(book.title),
        subtitle: Text(book.description,
            maxLines: 2, overflow: TextOverflow.ellipsis),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              child: Icon(Icons.edit),
              onTap: () => context.push("/edit_book", extra: book),
            ),
            InkWell(
              child: Icon(Icons.delete),
              onTap: () => context.read<BookProvider>().deleteBook(book.id),
            ),
          ],
        ),
      );
}
