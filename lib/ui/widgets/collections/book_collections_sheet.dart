import 'package:flutter/material.dart'
;
import '../../../utils/helper.dart';

import 'book_collections_list.dart';

class BookCollectionsSheet extends StatelessWidget {

  Padding buildCollectionName(String text, context, {author = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Helper.hPadding),
      child: Text("$text",
          style: author
              ? TextStyle(color: Colors.white, fontSize: 20)
              : Theme.of(context).textTheme.headline3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15),

          //New collections title
          buildCollectionName("New Collections", context),

          SizedBox(height: 10),

          //New collections list
          BookCollectionList(
            books: [1, 2, 3, 4],
          ),

          SizedBox(height: 20),

          //Top Rated title
          buildCollectionName("Top Rated", context),

          SizedBox(height: 10),

          //Top Rated list
          BookCollectionList(
            books: [1, 2, 3, 4],
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }
}
