import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/genres_provider.dart';
import '../../providers/bottom_nav_bar_provider.dart';
import '../../providers/author_details_provider.dart';
import '../../providers/book_details_provider.dart';
import '../../providers/publishes_provider.dart';
import '../../providers/reviews_provider.dart';

import '../../services/repositories/data_repository.dart';

import '../../ui/screens/login_screen.dart';
import '../../ui/screens/home_screen.dart';
import '../../ui/screens/primary/book_collections_screen.dart';
import '../../ui/screens/primary/genre_books_screen.dart';
import '../../ui/screens/primary/authors_gallery_screen.dart';
import '../../ui/screens/primary/member_profile_screen.dart';
import '../../ui/screens/primary/member_bookshelf_screen.dart';
import '../../ui/screens/secondary/author_details_screen.dart';
import '../../ui/screens/secondary/book_details_screen.dart';

enum PageType { HOME, COLLECTIONS, GENRES, AUTHOR, BOOK, BOOKSHELF, AUTHORGALLERY, PROFILE, LOGIN }

extension ActivePage on PageType {
  String get name => describeEnum(this);

  Widget getRoute() {
    switch (this) {
      case PageType.HOME:
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<BottomNavBarProvider>(create: (_) => BottomNavBarProvider()),
            ChangeNotifierProvider<GenresProvider>(
              create: (_) => GenresProvider(dataRepository: DataRepository.instance),
            ),
            ChangeNotifierProvider<PublishesProvider>(
              create: (_) => PublishesProvider(dataRepository: DataRepository.instance),
            ),
            ChangeNotifierProvider<ReviewsProvider>(
              create: (_) => ReviewsProvider(dataRepository: DataRepository.instance),
            ),
            ChangeNotifierProxyProvider3<PublishesProvider, GenresProvider, ReviewsProvider,
                BookDetailsProvider>(
              create: (_) => BookDetailsProvider(
                publishesProvider: null,
                genresProvider: null,
                reviewsProvider: null,
                dataRepository: null,
              ),
              update: (ctx, pProv, gProv, rProv, prevBkDetails) => BookDetailsProvider(
                publishesProvider: pProv,
                genresProvider: gProv,
                reviewsProvider: rProv,
                dataRepository: DataRepository.instance,
              ),
            ),
            ChangeNotifierProxyProvider3<PublishesProvider, GenresProvider, ReviewsProvider,
                AuthorDetailsProvider>(
              create: (_) => AuthorDetailsProvider(
                publishesProvider: null,
                genresProvider: null,
                reviewsProvider: null,
                dataRepository: null,
              ),
              update: (ctx, pProv, gProv, rProv, prevBkDetails) => AuthorDetailsProvider(
                publishesProvider: pProv,
                genresProvider: gProv,
                reviewsProvider: rProv,
                dataRepository: DataRepository.instance,
              ),
            ),
          ],
          child: HomeScreen(),
        );
      case PageType.COLLECTIONS:
        return BookCollectionsScreen();
      case PageType.GENRES:
        return GenreBooksScreen();
      case PageType.AUTHOR:
        return AuthorDetailsScreen();
      case PageType.AUTHORGALLERY:
        return AuthorsGalleryScreen();
      case PageType.BOOK:
        return BookDetailsScreen();
      case PageType.BOOKSHELF:
        return MemberBookshelfScreen();
      case PageType.PROFILE:
        return MemberProfileScreen();
      case PageType.LOGIN:
        return LoginScreen();
      default:
        return BookCollectionsScreen();
    }
  }
}
