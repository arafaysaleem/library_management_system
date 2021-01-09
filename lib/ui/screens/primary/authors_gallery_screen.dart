import 'package:flutter/material.dart';

import '../../../utils/helper.dart';

import '../../widgets/authors/author_listings_sheet.dart';

class AuthorsGalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),

            //Menu Title
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Helper.hPadding),
                child: Text(
                  "Authors",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),

            SizedBox(height: 10),

            //Author listings sheet
            AuthorListingsSheet(),
          ],
        ),
      ),
    );
  }
}
