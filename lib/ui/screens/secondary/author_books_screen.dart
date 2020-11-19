import 'package:flutter/material.dart';

import '../../widgets/books/books_list.dart';

class AuthorBookScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final books = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Published Books"),
      ),
      body: BooksList(books: books),
    );
  }
}
