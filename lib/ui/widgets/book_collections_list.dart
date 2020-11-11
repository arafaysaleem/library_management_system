import 'package:flutter/material.dart';

import '../../utils/helper.dart';

import '../../models/book.dart';

class BookCollectionList extends StatelessWidget {

  //TODO: use this when Book class complete
  // final List<Book> books;

  final List<int> books;

  const BookCollectionList({
    Key key,
    @required this.books
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: books.length,

        //TODO: Change item builder to book item
        itemBuilder: (ctx, i) => Padding(
          padding: EdgeInsets.symmetric(horizontal: Helper.hPadding),
          child: Card(
            elevation: 3,
            color: Colors.primaries[i % Colors.primaries.length],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(width: 140),
          ),
        ),
      ),
    );
  }
}