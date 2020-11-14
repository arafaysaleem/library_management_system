import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/genre_provider.dart';

import '../../ui/screens/author_details_screen.dart';
import '../../ui/screens/book_details_screen.dart';
import '../../ui/screens/genre_books_screen.dart';
import '../../ui/screens/home_screen.dart';
import '../../ui/screens/login_screen.dart';
import '../../ui/screens/member_bookshelf_screen.dart';
import '../../ui/screens/member_profile_screen.dart';

enum PageType { HOME, GENRES, AUTHOR, BOOK, BOOKSHELF, PROFILE, LOGIN }

extension ActivePage on PageType {
  String get name => describeEnum(this);

  Widget getRoute() {
    switch (this) {
      case PageType.HOME:
        return HomeScreen();
      case PageType.GENRES:
        return ChangeNotifierProvider(
          create: (_) => GenreProvider(),
          child: GenreBooksScreen(),
        );
      case PageType.AUTHOR:
        return AuthorDetailsScreen();
      case PageType.BOOK:
        return BookDetailsScreen();
      case PageType.BOOKSHELF:
        return MemberBookshelfScreen();
      case PageType.PROFILE:
        return MemberProfileScreen();
      case PageType.LOGIN:
        return LoginScreen();
      default:
        return HomeScreen();
    }
  }
}
