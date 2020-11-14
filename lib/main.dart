import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'utils/enums/page_type_enum.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      initialRoute: PageType.HOME.name,
      routes: {
        PageType.HOME.name: (_) => PageType.HOME.getRoute(),
        PageType.COLLECTIONS.name: (_) => PageType.COLLECTIONS.getRoute(),
        PageType.GENRES.name: (_) => PageType.GENRES.getRoute(),
        PageType.AUTHOR.name: (_) => PageType.AUTHOR.getRoute(),
        PageType.BOOK.name: (_) => PageType.BOOK.getRoute(),
        PageType.BOOKSHELF.name: (_) => PageType.BOOKSHELF.getRoute(),
        PageType.PROFILE.name: (_) => PageType.PROFILE.getRoute(),
        PageType.LOGIN.name: (_) => PageType.LOGIN.getRoute(),
      },
    );
  }
}
