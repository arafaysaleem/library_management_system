import 'package:flutter/material.dart';

import '../../../utils/helper.dart';

class AuthorDetailsSheet extends StatelessWidget {
  final Color color;
  final String authorName;
  final String authorAge;
  final String authorCountry;
  final String authorBio;
  final int authorRating;
  final List<String> genres;

  const AuthorDetailsSheet({
    Key key,
    @required this.color,
    @required this.authorName,
    @required this.authorAge,
    @required this.authorCountry,
    @required this.authorBio,
    @required this.authorRating,
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
            child: buildAuthorDetails(context),
          ),
        ),

        //Author image
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

  Column buildAuthorDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 175),

        //Author Name
        Text(
          authorName,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 28,
          ),
        ),

        SizedBox(height: 5),

        //Author age
        Text(
          authorAge,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),

        SizedBox(height: 10),

        //Author country
        Text(
          authorCountry,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),

        SizedBox(height: 10),

        //Author ratings
        buildRatings(),

        SizedBox(height: 15),

        buildGenres(context),

        SizedBox(height: 15),

        Text(
          authorBio,
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
        for (int i = 0; i < authorRating; i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Icon(
              Icons.star,
              color: Colors.amber[700],
            ),
          ),

        //Empty stars
        for (int i = authorRating; i < 5; i++)
          Icon(
            Icons.star,
            color: Colors.grey[300],
          ),
      ],
    );
  }
}
