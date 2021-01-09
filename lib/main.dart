import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'services/repositories/data_repository.dart';

import 'providers/author_details_provider.dart';
import 'providers/book_details_provider.dart';
import 'providers/bottom_nav_bar_provider.dart';
import 'providers/genres_provider.dart';
import 'providers/publishes_provider.dart';
import 'providers/reviews_provider.dart';
import 'providers/issues_provider.dart';
import 'providers/members_provider.dart';

import 'utils/enums/page_type_enum.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MembersProvider>(
      create: (_) => MembersProvider(dataRepository: DataRepository.instance),
      child: InitialApp(),
    );
  }
}

class InitialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MembersProvider>(
      builder: (_, auth, __) {
        if (!auth.loggedIn)
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Library App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              primaryColor: Colors.blue[800],
              textTheme: TextTheme(
                headline1: GoogleFonts.literata(
                  textStyle: TextStyle(
                    fontSize: 50,
                    letterSpacing: .5,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                headline2: GoogleFonts.literata(
                  textStyle: TextStyle(
                    fontSize: 30,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                headline3: GoogleFonts.openSans(
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              visualDensity: VisualDensity.adaptivePlatformDensity,
              scaffoldBackgroundColor: Colors.blue[800],
              fontFamily: GoogleFonts.openSans().fontFamily,
              iconTheme: IconThemeData(color: Colors.grey[800]),
            ),
            home: PageType.LOGIN.getRoute(),
          );
        return MainApp(membersProvider: auth,);
      },
    );
  }
}

class MainApp extends StatelessWidget {
  final membersProvider;

  const MainApp({
    Key key,@required this.membersProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomNavBarProvider>(create: (_) => BottomNavBarProvider()),
        ChangeNotifierProvider<GenresProvider>(
          create: (_) => GenresProvider(dataRepository: DataRepository.instance),
        ),
        ChangeNotifierProvider<PublishesProvider>(
            create: (_) => PublishesProvider(dataRepository: DataRepository.instance)),
        ChangeNotifierProvider<ReviewsProvider>(
          create: (_) => ReviewsProvider(dataRepository: DataRepository.instance),
        ),
        ChangeNotifierProxyProvider3<PublishesProvider, GenresProvider, ReviewsProvider,
            BookDetailsProvider>(
          create: (_) => BookDetailsProvider(
            publishesProvider: null,
            genresProvider: null,
            reviewsProvider: null,
          ),
          update: (ctx, pProv, gProv, rProv, prevBkDetails) => BookDetailsProvider(
            publishesProvider: pProv,
            genresProvider: gProv,
            reviewsProvider: rProv,
          ),
        ),
        ChangeNotifierProxyProvider3<PublishesProvider, GenresProvider, ReviewsProvider,
            AuthorDetailsProvider>(
          create: (_) => AuthorDetailsProvider(
            publishesProvider: null,
            genresProvider: null,
            reviewsProvider: null,
          ),
          update: (ctx, pProv, gProv, rProv, prevBkDetails) => AuthorDetailsProvider(
            publishesProvider: pProv,
            genresProvider: gProv,
            reviewsProvider: rProv,
          ),
        ),
        ChangeNotifierProvider<IssuesProvider>(
          create: (_) => IssuesProvider(dataRepository: DataRepository.instance, currentMId: membersProvider.currentMId),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Library App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue[800],
          textTheme: TextTheme(
            headline1: GoogleFonts.literata(
              textStyle: TextStyle(
                fontSize: 50,
                letterSpacing: .5,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            headline2: GoogleFonts.literata(
              textStyle: TextStyle(
                fontSize: 30,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            headline3: GoogleFonts.openSans(
              textStyle: TextStyle(
                fontSize: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.blue[800],
          fontFamily: GoogleFonts.openSans().fontFamily,
          iconTheme: IconThemeData(color: Colors.grey[800]),
        ),
        initialRoute: PageType.HOME.name,
        routes: {
          PageType.HOME.name: (_) => PageType.HOME.getRoute(),
          PageType.COLLECTIONS.name: (_) => PageType.COLLECTIONS.getRoute(),
          PageType.GENRES.name: (_) => PageType.GENRES.getRoute(),
          PageType.AUTHOR.name: (_) => PageType.AUTHOR.getRoute(),
          PageType.MEMBERPREFS.name: (_) => PageType.MEMBERPREFS.getRoute(),
          PageType.AUTHORGALLERY.name: (_) => PageType.AUTHORGALLERY.getRoute(),
          PageType.AUTHORBOOKS.name: (_) => PageType.AUTHORBOOKS.getRoute(),
          PageType.BOOK.name: (_) => PageType.BOOK.getRoute(),
          PageType.BOOKSHELF.name: (_) => PageType.BOOKSHELF.getRoute(),
          PageType.PROFILE.name: (_) => PageType.PROFILE.getRoute(),
          PageType.LOGIN.name: (_) => PageType.LOGIN.getRoute(),
        },
      ),
    );
  }
}
