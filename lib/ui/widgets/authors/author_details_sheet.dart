import 'package:flutter/material.dart';

import '../../../utils/helper.dart';

import '../../../models/genre.dart';

class AuthorDetailsSheet extends StatelessWidget {
  final String authorImageUrl;
  final String authorName;
  final int authorAge;
  final String authorCountry;
  final int authorRating;
  final List<Genre> genres;

  const AuthorDetailsSheet({
    Key key,
    @required this.authorImageUrl,
    @required this.authorName,
    @required this.authorAge,
    @required this.authorCountry,
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
          child: CircleAvatar(
            radius: 110,
            backgroundImage: NetworkImage(authorImageUrl),
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
          "$authorAge yrs old",
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
        Helper.buildRatings(authorRating),

        SizedBox(height: 15),

        Helper.buildGenres(Theme.of(context).primaryColor,genres),

        SizedBox(height: 15),

      ],
    );
  }
}
