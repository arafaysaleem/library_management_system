import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/genre_provider.dart';

import 'common/search_textfield.dart';
import 'genres_books_list.dart';

class BookListingsSheet extends StatelessWidget {
  final PageController genreController;

  const BookListingsSheet({
    Key key,
    @required this.genreController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final genreProvider= Provider.of<GenreProvider>(context,listen: false);
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
              child: PageView.builder(
                controller: genreController,
                itemCount: genreProvider.genres.length,
                onPageChanged: genreProvider.setActiveIndex,
                itemBuilder: (ctx, i) => GenreBooksList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
