import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Icon 1
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Icon(
                  Icons.library_books_outlined,
                  color: Theme.of(context).primaryColor.withOpacity(0.6),
                  size: 26,
                ),
                onTap: () {},
              ),
              SizedBox(height: 5),
              Text(
                "Home",
                style: TextStyle(
                  color: Theme.of(context).primaryColor.withOpacity(0.6),
                ),
              ),
            ],
          ),

          //Icon 2
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Icon(
                  Icons.menu_book_outlined,
                  color: Theme.of(context).primaryColor.withOpacity(1),
                  size: 26,
                ),
                onTap: () {},
              ),
              SizedBox(height: 5),
              Text(
                "Library",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor.withOpacity(1),
                ),
              ),
            ],
          ),

          //Icon 3
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Icon(
                  Icons.book_outlined,
                  color: Theme.of(context).primaryColor.withOpacity(0.6),
                  size: 26,
                ),
                onTap: () {},
              ),
              SizedBox(height: 5),
              Text(
                "Borrowed",
                style: TextStyle(
                  color: Theme.of(context).primaryColor.withOpacity(0.6),
                ),
              ),
            ],
          ),

          //Icon 4
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Icon(
                  Icons.person_outline,
                  color: Theme.of(context).primaryColor.withOpacity(0.6),
                  size: 26,
                ),
                onTap: () {},
              ),
              SizedBox(height: 5),
              Text(
                "Profile",
                style: TextStyle(
                  color: Theme.of(context).primaryColor.withOpacity(0.6),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}