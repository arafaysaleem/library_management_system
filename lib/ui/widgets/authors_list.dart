import 'package:flutter/material.dart';

import '../../utils/helper.dart';

import '../../utils/enums/page_type_enum.dart';


class AuthorsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (ctx, i) => Divider(
        thickness: 1,
        height: 36,
      ),
      itemBuilder: (ctx, i) => AuthorsListItem(
        i: i,
      ),
    );
  }
}

class AuthorsListItem extends StatelessWidget {
  const AuthorsListItem({
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
            page: PageType.AUTHOR,
            arguments: {
              "color": color,
              "a_first_name": "Author F Name $i",
              "a_last_name": "Author L Name $i",
              "a_age": "Author age $i",
              "a_country": "Author country $i",
              "a_rating": i % 6,
              "a_bio": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"
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
                shape: BoxShape.circle,
              ),
            ),

            SizedBox(width: 20),

            //Titles
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Author age
                Text(
                  "Author age $i",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: 10),

                //Author name (F+L)
                Text(
                  "Author Name $i",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 10),

                //Author rating
                Text(
                  "Author Rating $i",
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
