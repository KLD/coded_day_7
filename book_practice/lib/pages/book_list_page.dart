import 'package:book_practice/providers/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class BookListPage extends StatelessWidget {
  BookListPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book List"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit),
        onPressed: () {
          context.read<BookProvider>().loadBooks();
        },
      ),
      body: context.watch<BookProvider>().isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () async {
                // call  loadBooks
              },
              child: ListView.builder(
                  itemCount: context.watch<BookProvider>().books.length,
                  itemBuilder: (context, index) {
                    var bookProvider = context.watch<BookProvider>();

                    var book = bookProvider.books[index];
                    return ListTile(
                      title: Text(book.title),
                      subtitle: Text(
                        book.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      leading: Image.network(book.image),
                    );
                  }),
            ),
    );
  }
}
