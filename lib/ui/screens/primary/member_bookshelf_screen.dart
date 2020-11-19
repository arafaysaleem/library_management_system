import 'package:flutter/material.dart';

import '../../../utils/helper.dart';

import '../../../models/book.dart';

class MemberBookshelfScreen extends StatelessWidget {
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
                  "Your Books",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),

            SizedBox(height: 15),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: MyBorrowsList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyBorrowsList extends StatelessWidget {
  final List<Book> myBooks = [
    Book.initialData(),
    Book.initialData(),
    Book.initialData(),
    Book.initialData(),
  ];

  bool isDue(int i) => i % 2 == 0 ? true : false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: myBooks.length,
      itemBuilder: (ctx, i) => BorrowListItem(
        isDue: isDue(i),
        bookName: "Harry Potter",
        authorName: "J.K. Rowling",
        issueDate: "22-12-2020",
        date: "22-01-2021",
      ),
    );
  }
}

class BorrowListItem extends StatelessWidget {
  final bool isDue;
  final String bookName;
  final String authorName;
  final String issueDate;
  final String date;

  const BorrowListItem({
    Key key,
    @required this.isDue,
    @required this.bookName,
    @required this.authorName,
    @required this.issueDate,
    @required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      height: 185,
      child: Stack(
        children: [
          //Borrow details card
          Positioned.fill(
            top: 40,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                child: Row(
                  children: [
                    SizedBox(width: 120),

                    //Borrow details
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //Book Title
                        Text(
                          bookName,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        //Author name
                        Text(
                          "By $authorName",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),

                        SizedBox(height: 10),

                        //Issue date
                        Text(
                          "Issued on: $issueDate",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),

                        SizedBox(height: 3),

                        //If returned, then change to return date
                        Text(
                          isDue ? "Due on: $date" : "Returned on: $date",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          //Book Image
          Positioned(
            left: 15,
            child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                height: 155,
                width: 100,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: Colors.black,
                  //child: Image.network(myBooks[i].imageUrl),
                ),
              ),
            ),
          ),

          //Borrow status
          Positioned(
            right: 20,
            top: 20,
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: BoxDecoration(
                  color: isDue ? Colors.red : Colors.green,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(10),
                child: Icon(
                  isDue ? Icons.timer : Icons.check,
                  size: 26,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
