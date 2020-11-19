import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/genres_provider.dart';

import '../../../utils/helper.dart';

import '../../widgets/collections/book_listings_sheet.dart';
import '../../widgets/books/genres_list.dart';

class GenreBooksScreen extends StatelessWidget {
  final PageController _genreController = PageController();

  @override
  Widget build(BuildContext context) {
    final genreProvider = Provider.of<GenresProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: genreProvider.genres.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
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
                    genreController: _genreController,
                  ),

                  SizedBox(height: 10),

                  //Book listings sheet
                  BookListingsSheet(
                    genreController: _genreController,
                  ),
                ],
              ),
      ),
    );
  }
}
