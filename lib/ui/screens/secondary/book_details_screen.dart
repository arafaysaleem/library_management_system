import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/book_details_provider.dart';

import '../../../utils/helper.dart';

import '../../../models/book_details.dart';
import '../../../models/book.dart';

import '../../widgets/common/bottom_button_bar.dart';
import '../../widgets/books/book_details_sheet.dart';

class BookDetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final int bkId = ModalRoute.of(context).settings.arguments;
    final bookDetailsProvider = Provider.of<BookDetailsProvider>(context,listen: false);
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<BookDetails>(
          future: bookDetailsProvider.getBookDetails(bkId),
          builder: (ctx,snapshot) {
            if(snapshot.hasData) {
              final BookDetails bookDetails = snapshot.data;
              final Book book = bookDetails.book;
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
                      child: BookDetailsSheet(
                        bookTitle: book.name,
                        bookAuthor: bookDetails.authors,
                        bookImageUrl: book.imageUrl,
                        bookBio: book.bio,
                        bookPublishedDate: Helper.datePresenter(book.publishedDate),
                        bookRating: book.rating,
                        genres: bookDetails.genres,
                      ),
                    ),
                  ],
                ),
              );
            }
            else{
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      bottomNavigationBar: BottomButtonBar(label: "BORROW", onPressed: () {}),
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
