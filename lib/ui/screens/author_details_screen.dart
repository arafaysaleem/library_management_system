import 'package:flutter/material.dart';

import '../../utils/helper.dart';

import '../widgets/author_details_sheet.dart';

class AuthorDetailsScreen extends StatelessWidget {
  //Use this when AuthorDetails class is ready
  //final AuthorDetails _authorDetails;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> authorDetails =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                  color: authorDetails["color"],
                  authorName:
                      "${authorDetails["a_first_name"]} ${authorDetails["a_last_name"]}",
                  authorAge: authorDetails["a_age"],
                  authorCountry: authorDetails["a_country"],
                  authorBio: authorDetails["a_bio"],
                  authorRating: authorDetails["a_rating"],
                  genres: authorDetails['genres'],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: FlatButton(
          padding: const EdgeInsets.symmetric(vertical: 16),
          onPressed: () {},
          color: Colors.green[500],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            "View Books",
            style: TextStyle(
                letterSpacing: 1.4, fontSize: 15, color: Colors.white),
          ),
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
