import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/publishes_provider.dart';

import '../../../utils/helper.dart';

import '../../widgets/collections/book_collections_sheet.dart';
import '../../widgets/books/books_list.dart';
import '../../widgets/collections/top_authors_list.dart';

class BookCollectionsScreen extends StatefulWidget {
  @override
  _BookCollectionsScreenState createState() => _BookCollectionsScreenState();
}

class _BookCollectionsScreenState extends State<BookCollectionsScreen> {
  TextEditingController _textEditingController = TextEditingController();
  bool isSearchActive;

  @override
  void initState() {
    isSearchActive = false;
    super.initState();
  }

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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Helper.hPadding),
                child: TextField(
                  onChanged: (val) => setState(() {
                    if (val.isNotEmpty)
                      return isSearchActive = true;
                    else
                      return isSearchActive = false;
                  }),
                  keyboardType: TextInputType.name,
                  controller: _textEditingController,
                  cursorColor: Theme.of(context).primaryColor,
                  maxLines: 1,
                  textInputAction: TextInputAction.search,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(17),
                    filled: true,
                    fillColor: Colors.blue[900],
                    hintText: "What would you like to read?",
                    hintStyle: TextStyle(color: Colors.white54),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.4,
                        style: BorderStyle.solid,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),

              //Collections sheet
              isSearchActive
                  ? BookSearchSheet(searchTerm: _textEditingController.text.trim(),)
                  : Column(
                      children: [
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
                        Consumer<PublishesProvider>(
                          builder: (_, pubProv, __) => TopAuthorsList(
                            authors: pubProv.authors,
                          ),
                        ),

                        SizedBox(height: 10),

                        //Collections Container
                        BookCollectionsSheet(),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookSearchSheet extends StatelessWidget {
  final String searchTerm;

  const BookSearchSheet({Key key, @required this.searchTerm}) : super(key: key);

  Padding buildCollectionName(String text, context, {author = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Helper.hPadding),
      child: Text(
        "$text",
        style: author
            ? TextStyle(color: Colors.white, fontSize: 20)
            : Theme.of(context).textTheme.headline3,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15),

          //New collections title
          buildCollectionName("Search Books", context),

          SizedBox(height: 10),

          //New collections list
          Expanded(
            child: Consumer<PublishesProvider>(
              builder: (ctx, pubProv, child) => BooksList(
                books: pubProv.books.where((book) => book.name.contains(searchTerm)).toList(),
              ),
            ),
          ),

          SizedBox(height: 10),
        ],
      ),
    );
  }
}
