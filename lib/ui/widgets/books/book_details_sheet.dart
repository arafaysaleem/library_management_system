import 'package:flutter/material.dart';

import '../../../utils/helper.dart';

import '../../../models/author.dart';
import '../../../models/genre.dart';

import '../common/genre_chips.dart';
import '../common/ratings.dart';

class BookDetailsSheet extends StatelessWidget {
  final String bookTitle;
  final List<Author> bookAuthor;
  final String bookPublishedDate;
  final String bookImageUrl;
  final String bookBio;
  final int bookRating;
  final List<Genre> genres;

  const BookDetailsSheet({
    Key key,
    @required this.bookTitle,
    @required this.bookAuthor,
    @required this.bookPublishedDate,
    @required this.bookBio,
    @required this.bookRating,
    @required this.genres,
    @required this.bookImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // White Details Card
        Positioned.fill(
          top: 65,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: Helper.hPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: buildBookDetails(context),
          ),
        ),

        //Book image
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 230,
            width: 155,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(bookImageUrl),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }

  Column buildBookDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 175),

        //Book Title
        Text(
          bookTitle,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 28,
          ),
          textAlign: TextAlign.center,
        ),

        SizedBox(height: 5),

        //Book author
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          runSpacing: 10,
          children: bookAuthor
              .map(
                (author) => Text(
                  "${author.firstName} ${author.lastName}",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
              .toList(),
        ),

        SizedBox(height: 10),

        //Published date
        Text(
          "Published at $bookPublishedDate",
        ),

        SizedBox(height: 10),

        //Book ratings
        Ratings(rating: bookRating),

        SizedBox(height: 15),

        GenreChips(color: Theme.of(context).primaryColor, genres: genres),

        SizedBox(height: 15),

        Text(
          bookBio,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black45,
          ),
        ),
      ],
    );
  }
}
