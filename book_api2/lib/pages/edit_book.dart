import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../models/book_model.dart';
import '../provider/book_provider.dart';

class EditBookPage extends StatefulWidget {
  final Book book;
  const EditBookPage(this.book, {super.key});

  @override
  State<EditBookPage> createState() => _EditBookPageState();
}

class _EditBookPageState extends State<EditBookPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();

  File? imageData;

  bool isSubmitting = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    titleController.text = widget.book.title;
    descriptionController.text = widget.book.description;
    priceController.text = widget.book.price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Book")),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              controller: titleController,
              enabled: !isSubmitting,
              decoration: InputDecoration(
                hintText: "Title",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Required field";
                }
                return null;
              },
            ),
            TextFormField(
              controller: descriptionController,
              enabled: !isSubmitting,
              decoration: InputDecoration(
                hintText: "Description",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Required field";
                }
                return null;
              },
            ),
            TextFormField(
              controller: priceController,
              enabled: !isSubmitting,
              decoration: InputDecoration(
                hintText: "Price",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Required field";
                }
                if (double.tryParse(value) == null) {
                  return "Must be double";
                }
                return null;
              },
            ),
            if (imageData != null)
              Image.file(
                imageData!,
                height: 100,
                width: 100,
              )
            else
              Image.network(
                widget.book.image,
                height: 100,
                width: 100,
              ),
            FormField<String>(
              validator: (value) {
                if (imageData == null) {
                  return "Required image";
                }
                return null;
              },
              builder: (state) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                      onPressed: isSubmitting
                          ? null
                          : () async {
                              var image = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);

                              if (image == null) return;

                              setState(() {
                                imageData = File(image.path);
                              });
                            },
                      child: Text("Add Image")),
                  if (state.hasError)
                    Text(
                      state.errorText!,
                      style: TextStyle(color: Colors.red),
                    )
                ],
              ),
            ),
            Spacer(),
            ElevatedButton(
                onPressed: context.watch<BookProvider>().isLoading
                    ? null
                    : () async {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        setState(() {
                          isSubmitting = true;
                        });
                        await context.read<BookProvider>().editBook(
                              book: widget.book,
                              title: titleController.text,
                              price: double.parse(priceController.text),
                              description: descriptionController.text,
                              image: imageData!,
                            );

                        context.pop();
                      },
                child: Text("Save")),
          ]),
        ),
      ),
    );
  }
}
