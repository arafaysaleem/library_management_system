import 'dart:collection';

import 'package:flutter/material.dart';

class GenreProvider with ChangeNotifier{
  //Temporary
  //TODO: use this when Genre complete
  // final List<Genre> genres;
  final _genres = [
    'Popular',
    'Art',
    'Business',
    'Entrepreneurship',
    'Fantasy',
    'Horror',
    'Mystery',
    'Fiction',
  ];

  int _activeIndex = 0;

  UnmodifiableListView<String> get genres => UnmodifiableListView(_genres);

  int get activeIndex => _activeIndex;

  setActiveIndex(int newIndex) {
    _activeIndex = newIndex;
    notifyListeners();
  }

}