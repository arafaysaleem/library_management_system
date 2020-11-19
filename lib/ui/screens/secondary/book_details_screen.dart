import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/issues_provider.dart';
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
    final bookDetailsProvider = Provider.of<BookDetailsProvider>(context);
    final future = bookDetailsProvider.getBookDetails(bkId);
    final issueProvider = Provider.of<IssuesProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<BookDetails>(
          future: future,
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.genres[0] != null) {
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
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
      bottomNavigationBar: FutureBuilder<BookDetails>(
        future: future,
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            final BookDetails bookDetails = snapshot.data;
            return BottomButtonBar(
                label: "BORROW",
                onPressed: () async {
                  final bool borrowed = await issueProvider.issueBook(bkId, bookDetails);

                  //Confirmation popup
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    builder: (_) => Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      padding: const EdgeInsets.only(top: 12),
                      child: Column(
                        children: [
                          Container(
                            width: 70,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          Divider(
                            color: Colors.grey[400],
                            height: 25,
                          ),
                          SizedBox(height: 30),
                          Icon(
                            borrowed ? Icons.check_circle : Icons.cancel,
                            color: borrowed ? Colors.green : Colors.red,
                            size: 85,
                          ),
                          SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40.0),
                            child: Text(
                              borrowed
                                  ? "This book has been issued for 1 month"
                                  : "This book is currently not available for issue",
                              style: TextStyle(
                                fontSize: 21,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return BottomButtonBar(
              label: "BORROW",
              onPressed: () {},
              color: Colors.grey[400],
            );
          }
        },
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
