import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'enums/page_type_enum.dart';

class Helper{
  static final double hPadding = 20.0;

  static navigateToPage({@required BuildContext context, @required PageType page,Object arguments}){
    Navigator.of(context).pushNamed(page.name,arguments: arguments);
  }

  static String dateSerializer(DateTime date){
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static DateTime dateDeserializer(String iso8601date){
    return DateTime.tryParse(iso8601date);
  }

  static String datePresenter(DateTime date){
    return DateFormat('dd-MM-yyyy').format(date);
  }

  static Row buildRatings(int rating) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Rating stars
        for (int i = 0; i < rating; i++)
          Padding(
            padding: i == 0 ? const EdgeInsets.only(right: 3) : const EdgeInsets.symmetric(horizontal: 3),
            child: Icon(
              Icons.star,
              color: Colors.amber[700],
            ),
          ),

        //Empty stars
        for (int i = rating; i < 5; i++)
          Padding(
            padding: i == 0 ? const EdgeInsets.only(right: 3) : const EdgeInsets.symmetric(horizontal: 3),
            child: Icon(
              Icons.star,
              color: Colors.grey[300],
            ),
          ),
      ],
    );
  }

  static Wrap buildGenres(BuildContext context, genres) {
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
            label: Text(genre.name),
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
}