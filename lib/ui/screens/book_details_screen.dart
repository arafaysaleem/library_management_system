import 'package:flutter/material.dart';

import '../../utils/helper.dart';

import '../widgets/book_details_sheet.dart';

class BookDetailsScreen extends StatelessWidget {
  //Use this when BookDetails class is ready
  //final BookDetails _bookDetails;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> bookDetails =
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
                child: BookDetailsSheet(
                  bookTitle: bookDetails["bk_title"],
                  bookAuthor: bookDetails["bk_author"],
                  bookBio: bookDetails["bk_bio"],
                  bookPublishedDate: bookDetails["published_date"],
                  bookRating: bookDetails["bk_rating"],
                  color: bookDetails["color"],
                  genres: bookDetails["genres"],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
        child: FlatButton(
          padding: const EdgeInsets.symmetric(vertical: 16),
          onPressed: () {},
          color: Colors.green[500],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            "BORROW",
            style: TextStyle(letterSpacing: 1.4,fontSize: 15,color: Colors.white),
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
              "Book Details",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ],
      ),
    );
  }
}
