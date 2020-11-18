import 'package:flutter/material.dart';
import 'package:library_management_system/models/book.dart';
import 'package:provider/provider.dart';

import '../../../providers/publishes_provider.dart';

import '../../../utils/enums/page_type_enum.dart';
import '../../../utils/helper.dart';

class GenreBooksList extends StatelessWidget {
  final int gId;

  const GenreBooksList({Key key, @required this.gId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Book>>(
      stream: Provider.of<PublishesProvider>(context, listen: false).getGenreBooks(gId),
      builder: (ctx,snapshot) {
        if(snapshot.hasData){
          final genreBooks = snapshot.data;
          return ListView.separated(
            itemCount: genreBooks.length,
            separatorBuilder: (ctx, i) => Divider(
              thickness: 1,
              height: 36,
            ),
            itemBuilder: (ctx, i) => InkWell(
              onTap: () {
                Helper.navigateToPage(context: context, page: PageType.BOOK, arguments: {
                  "color": Colors.green,
                  "bk_title": "Book Title 1",
                  "bk_author": "Book Author 1",
                  "bk_rating": 1,
                  "published_date": "10/12/2020",
                  "bk_bio": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"
                      " ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco"
                      " laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur "
                      "adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  "genres": ['Horror', 'Fantasy', 'Sci-Fi', 'Romance', 'Mystery']
                });
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
        return Center(child: CircularProgressIndicator(),);
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
          //Container box
          Container(
            height: 130,
            width: 110,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(bookImageUrl),
                  fit: BoxFit.cover,
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

              SizedBox(height: 0),

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
              Helper.buildRatings(bookRating),
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
