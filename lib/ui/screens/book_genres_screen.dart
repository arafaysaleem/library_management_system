import 'package:flutter/material.dart';

import '../../utils/helper.dart';

import '../widgets/book_listings_sheet.dart';
import '../widgets/genres_list.dart';

class BookGenresScreen extends StatelessWidget {
  final PageController _controller=PageController();

  //Temporary
  final genres=[
    'Popular',
    'Art',
    'Business',
    'Entrepreneurship',
    'Fantasy',
    'Horror',
    'Mystery',
    'Fiction',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),

            //Menu Title
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Helper.hPadding),
                child: Text(
                  "Genres",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),

            SizedBox(height: 20),

            //List of genres
            GenresList(
              genres: genres,
              controller: _controller,
            ),

            SizedBox(height: 10),

            //Book listings sheet
            BookListingsSheet(controller: _controller,noOfGenres: genres.length),
          ],
        ),
      ),
    );
  }
}
