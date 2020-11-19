import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/publishes_provider.dart';

import '../../../utils/enums/page_type_enum.dart';
import '../../../utils/helper.dart';

import '../../../models/book.dart';

import '../common/ratings.dart';

class GenreBooksList extends StatelessWidget {
  final int gId;
  final String searchTerm;

  const GenreBooksList({Key key, @required this.gId, this.searchTerm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Book>>(
      stream: Provider.of<PublishesProvider>(context, listen: false).getGenreBooks(gId),
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          List<Book> genreBooks = snapshot.data;
          genreBooks = genreBooks.where((book) => book.name.contains(searchTerm)).toList();
          return ListView.separated(
            itemCount: genreBooks.length,
            separatorBuilder: (ctx, i) => Divider(
              thickness: 1,
              height: 36,
            ),
            itemBuilder: (ctx, i) => InkWell(
              onTap: () {
                Helper.navigateToPage(
                  context: context,
                  page: PageType.BOOK,
                  arguments: genreBooks[i].id,
                );
              },
              child: GenresBooksListItem(
                bookPublishedDate: Helper.datePresenter(genreBooks[i].publishedDate),
                bookTitle: genreBooks[i].name,
                bookRating: genreBooks[i].rating,
                bookImageUrl: genreBooks[i].imageUrl,
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class GenresBooksListItem extends StatelessWidget {
  const GenresBooksListItem({
    Key key,
    @required this.bookRating,
    @required this.bookPublishedDate,
    @required this.bookTitle,
    @required this.bookImageUrl,
  }) : super(key: key);

  final int bookRating;
  final String bookPublishedDate;
  final String bookTitle;
  final String bookImageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Helper.hPadding),
      child: Row(
        children: [
          //Book Image
          Container(
            height: 160,
            width: 115,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(bookImageUrl),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          SizedBox(width: 20),

          //Titles
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Book author
              Text(
                bookPublishedDate,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),

              SizedBox(height: 8),

              //Book Title
              SizedBox(
                width: 130,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        bookTitle,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              //Book rating
              Ratings(rating: bookRating),
            ],
          ),

          Spacer(),

          //Arrow
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black26,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
