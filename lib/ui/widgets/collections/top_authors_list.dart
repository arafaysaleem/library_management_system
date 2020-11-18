import 'package:flutter/material.dart';
import 'package:library_management_system/providers/book_details_provider.dart';
import 'package:provider/provider.dart';

import '../../../utils/helper.dart';

class TopAuthorsList extends StatelessWidget {
  //TODO: use this when Author complete
  // final List<Author> authors;

  final List<int> authors;

  const TopAuthorsList({
    Key key,
    @required this.authors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookDetailsProvider>(context, listen: false);
    return SizedBox(
      height: 110,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: authors.length,

        //TODO: Change item builder to author item
        itemBuilder: (ctx, i) => Padding(
          padding: EdgeInsets.symmetric(horizontal: Helper.hPadding),
          child: InkWell(
            onTap: () async {
              print(await provider.getBookDetails(66));
            },
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.primaries[i % Colors.primaries.length],
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Name $i",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
