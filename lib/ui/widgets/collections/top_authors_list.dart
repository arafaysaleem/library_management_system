import 'package:flutter/material.dart';

import '../../../utils/helper.dart';

import '../../../utils/enums/page_type_enum.dart';

import '../../../models/author.dart';

class TopAuthorsList extends StatelessWidget {
  final List<Author> authors;

  const TopAuthorsList({
    Key key,
    @required this.authors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135,
      child: authors.isEmpty
          ? Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Helper.hPadding),
                child: LinearProgressIndicator(),
              ),
            )
          : ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: authors.length,
              itemBuilder: (ctx, i) => Padding(
                padding: EdgeInsets.symmetric(horizontal: Helper.hPadding),
                child: InkWell(
                  onTap: () {
                    Helper.navigateToPage(
                      context: context,
                      page: PageType.AUTHOR,
                      arguments: authors[i].id,
                    );
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(authors[i].imageUrl),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "${authors[i].firstName}\n${authors[i].lastName}",
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
