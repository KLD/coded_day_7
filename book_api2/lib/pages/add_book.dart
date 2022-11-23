import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../provider/book_provider.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({super.key});

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  File? imageData;

  bool isSubmitting = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Book")),
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
                height: 50,
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
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  setState(() {
                    isSubmitting = true;
                  });
                  await context.read<BookProvider>().addBook(
                        title: titleController.text,
                        price: double.parse(priceController.text),
                        description: descriptionController.text,
                        image: imageData!,
                      );

                  context.pop();
                },
                child: Text("Add Book")),
          ]),
        ),
      ),
    );
  }
}
