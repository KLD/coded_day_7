import 'package:book_practice/models/book_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BookProvider extends ChangeNotifier {
  List<BookModel> books = [];
  bool isLoading = true;

  BookProvider() {
    loadBooks();
  }

  void loadBooks() async {
    isLoading = true;
    notifyListeners();

    Dio client = Dio();

    var response =
        await client.get("https://coded-books-api-crud.herokuapp.com/books/");

    var body = response.data as List;

    books = body
        .map(
          (json) => BookModel.fromJson(json),
        )
        .toList();

    isLoading = false;
    notifyListeners();
  }
}
