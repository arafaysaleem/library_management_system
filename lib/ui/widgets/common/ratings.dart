import 'package:flutter/material.dart';

class Ratings extends StatelessWidget {
  final int rating;
  final double size;

  const Ratings({
    Key key,
    @required this.rating, this.size=24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Rating stars
        for (int i = 0; i < rating; i++)
          Padding(
            padding:
            i == 0 ? const EdgeInsets.only(right: 3) : const EdgeInsets.symmetric(horizontal: 3),
            child: Icon(
              Icons.star,
              size: size,
              color: Colors.amber[700],
            ),
          ),

        //Empty stars
        for (int i = rating; i < 5; i++)
          Padding(
            padding:
            i == 0 ? const EdgeInsets.only(right: 3) : const EdgeInsets.symmetric(horizontal: 3),
            child: Icon(
              Icons.star,
              size: size,
              color: Colors.grey[300],
            ),
          ),
      ],
    );
  }
}
