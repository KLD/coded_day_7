import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/book_model.dart';

class BookProvider extends ChangeNotifier {
  List<Book> books = [];

  bool isLoading = false;

  BookProvider() {
    loadBooks();
  }

  Future<void> loadBooks() async {
    isLoading = true;
    notifyListeners();

    Dio client = Dio();

    var response =
        await client.get("https://coded-books-api-crud.herokuapp.com/books");

    var booksJson = response.data as List;

    books = booksJson
        .map((bookJson) => Book(
              id: bookJson['id'],
              title: bookJson['title'],
              description: bookJson['description'],
              image: bookJson['image'],
              price: bookJson['price'].toString(),
            ))
        .toList();

    isLoading = false;
    notifyListeners();
  }

  Future<void> addBook({
    required String title,
    required String description,
    required File image,
    required double price,
  }) async {
    isLoading = true;
    notifyListeners();

    Dio client = Dio();

    await client.post("https://coded-books-api-crud.herokuapp.com/books",
        data: FormData.fromMap({
          "title": title,
          "description": description,
          "image": await MultipartFile.fromFile(image.path),
          "price": price,
        }));

    await loadBooks();
  }

  Future<void> editBook({
    required Book book,
    required String? title,
    required String? description,
    required File? image,
    required double? price,
  }) async {
    isLoading = true;
    notifyListeners();

    Dio client = Dio();

    await client.put(
        "https://coded-books-api-crud.herokuapp.com/books/${book.id}",
        data: FormData.fromMap({
          "title": title ?? book.title,
          "description": description ?? book.description,
          if (image != null) "image": await MultipartFile.fromFile(image.path),
          "price": price ?? book.price,
        }));

    await loadBooks();
  }

  // delete book
  Future<void> deleteBook(int id) async {
    Dio client = Dio();

    await client.delete("https://coded-books-api-crud.herokuapp.com/books/$id");

    await loadBooks();
  }
}
