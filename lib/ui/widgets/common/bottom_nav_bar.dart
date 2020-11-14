import 'package:flutter/material.dart';

import '../../../utils/enums/page_type_enum.dart';

class BottomNavBar extends StatefulWidget {
  final PageController pageController;

  const BottomNavBar({
    Key key,
    @required this.pageController,
  }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  PageType _activePage;

  @override
  void initState() {
    _activePage = PageType.COLLECTIONS;
    super.initState();
  }

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
          buildBarItem(
            icon: Icons.library_books_outlined,
            label: "Home",
            page: PageType.COLLECTIONS,
          ),

          //Icon 2
          buildBarItem(
            icon: Icons.menu_book_outlined,
            label: "Library",
            page: PageType.GENRES,
          ),

          //Icon 3
          buildBarItem(
            icon: Icons.book_outlined,
            label: "Bookshelf",
            page: PageType.BOOKSHELF,
          ),

          //Icon 4
          buildBarItem(
            icon: Icons.person_outline,
            label: "Profile",
            page: PageType.PROFILE,
          ),
        ],
      ),
    );
  }

  int getPageNumber(PageType page) {
    switch (page) {
      case PageType.COLLECTIONS:
        return 0;
      case PageType.GENRES:
        return 1;
      case PageType.BOOKSHELF:
        return 2;
      case PageType.PROFILE:
        return 3;
      default:
        return 0;
    }
  }

  Widget buildBarItem({
    @required IconData icon,
    @required String label,
    @required PageType page,
  }) {
    final bool active = _activePage == page;
    return InkWell(
      onTap: () {
        if (_activePage != page) {
          setState(() {
            _activePage = page;
          });
          widget.pageController.animateToPage(
            getPageNumber(page),
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Theme.of(context).primaryColor.withOpacity(active ? 1 : 0.4),
            size: 26,
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color:
                  Theme.of(context).primaryColor.withOpacity(active ? 1 : 0.4),
            ),
          ),
        ],
      ),
    );
  }
}
