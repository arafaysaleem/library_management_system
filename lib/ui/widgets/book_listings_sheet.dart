import 'package:flutter/material.dart';

import 'common/search_textfield.dart';
import 'genres_books_list.dart';

class BookListingsSheet extends StatelessWidget {
  final int noOfGenres;
  final PageController controller;

  const BookListingsSheet({
    Key key,
    @required this.noOfGenres,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),

            //Search Field
            SearchTextField(
              fillColor: Colors.blueGrey[50],
              inputTextColor: Theme.of(context).primaryColor,
              hintTextColor: Colors.black38,
            ),

            SizedBox(height: 20),

            //Books list
            Expanded(
              child: GenreBooksList(controller: controller, noOfGenres: noOfGenres),
            )
          ],
        ),
      ),
    );
  }
}
