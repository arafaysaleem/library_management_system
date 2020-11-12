import 'package:flutter/material.dart';

import '../../utils/enums/page_type_enum.dart';
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
        itemCount: 10,
        separatorBuilder: (ctx, i) => Divider(
          thickness: 1,
          height: 36,
        ),
        itemBuilder: (ctx, i) => GenresBooksListItem(
          i: i,
        ),
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
    final color = Colors.primaries[i % Colors.primaries.length];
    return InkWell(
      onTap: () {
        Helper.navigateToPage(
            context: context,
            page: PageType.BOOK,
            arguments: {
              "color": color,
              "bk_title": "Book Title $i",
              "bk_author": "Book Author $i",
              "bk_rating": i % 6,
              "published_date": "10/12/2020",
              "bk_bio":
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"
                      " ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco"
                      " laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur "
                      "adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              "genres": ['Horror', 'Fantasy', 'Sci-Fi', 'Romance', 'Mystery']
            });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Helper.hPadding),
        child: Row(
          children: [
            //Container box
            Container(
              height: 130,
              width: 110,
              decoration: BoxDecoration(
                color: color,
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
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black26,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
