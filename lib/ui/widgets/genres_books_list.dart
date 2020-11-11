import 'package:flutter/material.dart';

import '../../utils/helper.dart';

class GenreBooksList extends StatelessWidget {
  const GenreBooksList({
    Key key,
    @required this.controller,
    @required this.noOfGenres,
  }) : super(key: key);

  final PageController controller;
  final int noOfGenres;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: noOfGenres,
      itemBuilder: (ctx, i) => ListView.separated(
        itemCount: 6,
        separatorBuilder: (ctx, i) => Divider(
          thickness: 1,
          height: 36,
        ),
        itemBuilder: (ctx, i) => GenresBooksListItem(i: i,),
      ),
    );
  }
}

class GenresBooksListItem extends StatelessWidget {
  const GenresBooksListItem({
    Key key,
    @required this.i,
  }) : super(key: key);

  final int i;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Helper.hPadding),
      child: Row(
        children: [
          //Container box
          Container(
            height: 130,
            width: 110,
            decoration: BoxDecoration(
              color:
              Colors.primaries[i % Colors.primaries.length],
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          SizedBox(width: 20),

          //Titles
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Book author
              Text(
                "Book Author $i",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),

              SizedBox(height: 10),

              //Book Title
              Text(
                "Book Title $i",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),

              SizedBox(height: 10),

              //Book rating
              Text(
                "Book Rating $i",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black38,
                ),
              ),
            ],
          ),

          Spacer(),

          //Arrow
          InkWell(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black26,
                size: 20,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}