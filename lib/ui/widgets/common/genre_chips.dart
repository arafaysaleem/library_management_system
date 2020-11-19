import 'package:flutter/material.dart';

import '../../../models/genre.dart';

class GenreChips extends StatelessWidget {
  final Color color;
  final List<Genre> genres;

  const GenreChips({
    Key key,
    @required this.color,
    @required this.genres,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  color: color,
                  fontSize: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: color,
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
