import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/author_details_provider.dart';

import '../../../utils/helper.dart';

import '../../../models/author.dart';
import '../../../models/author_details.dart';

import '../../widgets/authors/author_details_sheet.dart';

class AuthorDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int aId = ModalRoute.of(context).settings.arguments;
    final authorDetailsProvider = Provider.of<AuthorDetailsProvider>(context);
    final future = authorDetailsProvider.getAuthorDetails(aId);
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<AuthorDetails>(
          future: future,
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.genres[0] != null) {
                final AuthorDetails authorDetails = snapshot.data;
                final Author author = authorDetails.author;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20),

                      //Back arrow & title
                      buildAppBar(context),

                      SizedBox(height: 30),

                      // Book Details Sheet
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: AuthorDetailsSheet(
                          authorImageUrl: author.imageUrl,
                          authorName: "${author.firstName} ${author.lastName}",
                          authorAge: author.age,
                          authorCountry: author.country,
                          authorRating: author.rating,
                          genres: authorDetails.genres,
                          books: authorDetails.books,
                        ),
                      ),
                    ],
                  ),
                );
              }
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Padding buildAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Helper.hPadding),
      child: Row(
        children: [
          //Arrow
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 8, 5, 8),
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white38,
              ),
            ),
          ),

          SizedBox(width: 30),

          //Page Title
          Center(
            child: Text(
              "Author Details",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ],
      ),
    );
  }
}
