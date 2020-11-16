import 'package:flutter/material.dart';

import '../../utils/helper.dart';

class BookDetailsSheet extends StatelessWidget {
  final Color color;
  final String bookTitle;
  final String bookAuthor;
  final String bookPublishedDate;
  final String bookBio;
  final int bookRating;
  final List<String> genres;

  const BookDetailsSheet({
    Key key,
    @required this.color,
    @required this.bookTitle,
    @required this.bookAuthor,
    @required this.bookPublishedDate,
    @required this.bookBio,
    @required this.bookRating,
    @required this.genres,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // White Details Card
        Positioned.fill(
          top: 60,
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
            height: 220,
            width: 170,
            decoration: BoxDecoration(
              color: color,
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
        ),

        SizedBox(height: 5),

        //Book author
        Text(
          bookAuthor,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),

        SizedBox(height: 10),

        //Published date
        Text(
          "Published at $bookPublishedDate",
        ),

        SizedBox(height: 10),

        //Book ratings
        buildRatings(),

        SizedBox(height: 15),

        buildGenres(context),

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

  Wrap buildGenres(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        ...genres
            .map(
              (genre) => Chip(
                elevation: 0,
                backgroundColor: Colors.white,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: EdgeInsets.zero,
                labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                label: Text(genre),
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1,
                  ),
                ),
              ),
            )
            .toList(),
      ],
    );
  }

  Row buildRatings() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Rating stars
        for (int i = 0; i < bookRating; i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Icon(
              Icons.star,
              color: Colors.amber[700],
            ),
          ),

        //Empty stars
        for (int i = bookRating; i < 5; i++)
          Icon(
            Icons.star,
            color: Colors.grey[300],
          ),
      ],
    );
  }
}
