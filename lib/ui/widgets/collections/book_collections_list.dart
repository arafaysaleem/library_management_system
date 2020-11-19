import 'package:flutter/material.dart';

import '../../../utils/helper.dart';

import '../../../utils/enums/page_type_enum.dart';

import '../../../models/book.dart';

class BookCollectionList extends StatelessWidget {
  final List<Book> books;

  const BookCollectionList({Key key, @required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (ctx, i) => Padding(
          padding: EdgeInsets.symmetric(horizontal: Helper.hPadding),
          child: InkWell(
            onTap: (){
              Helper.navigateToPage(
                context: context,
                page: PageType.BOOK,
                arguments: books[i].id,
              );
            },
            child: Card(
              elevation: 3,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                width: 140,
                child: Image.network(
                  books[i].imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
