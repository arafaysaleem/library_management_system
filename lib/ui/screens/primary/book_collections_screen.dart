import 'package:flutter/material.dart';

import '../../../utils/helper.dart';

import '../../widgets/collections/book_collections_sheet.dart';
import '../../widgets/common/search_textfield.dart';
import '../../widgets/collections/top_authors_list.dart';

class BookCollectionsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),

              //Title
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Helper.hPadding),
                  child: Text(
                    "Libreasy",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ),

              SizedBox(height: 20),

              //Search bar
              SearchTextField(
                fillColor: Colors.blue[900],
                hintTextColor: Colors.white54,
                inputTextColor: Colors.white,
              ),

              SizedBox(height: 30),

              //Top Authors title
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Helper.hPadding),
                child: Text(
                  "Top Authors",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),

              SizedBox(height: 10),

              //Top Authors list
              TopAuthorsList(
                authors: [1, 2, 3, 4],
              ),

              SizedBox(height: 20),

              //Collections Container
              BookCollectionsSheet()
            ],
          ),
        ),
      ),
    );
  }
}
