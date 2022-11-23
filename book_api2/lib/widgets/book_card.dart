import 'package:book_api/models/book_model.dart';
import 'package:book_api/provider/book_provider.dart';
import 'package:flutter/material.dart';
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(book.price.toString()),
            InkWell(
              child: Icon(Icons.delete),
              onTap: () => context.read<BookProvider>().deleteBook(book.id),
            ),
          ],
        ),
      );
}
