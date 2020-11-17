import 'dart:collection';

import 'package:flutter/material.dart';

import '../services/repositories/data_repository.dart';

import '../models/genre.dart';

class GenresProvider with ChangeNotifier {
  final DataRepository _dataRepository;

  GenresProvider({@required dataRepository})
      : _dataRepository = dataRepository {
    _initializeData();
  }

  final Map<int, Genre> _genres = Map();

  UnmodifiableMapView<int, Genre> get genresMap => UnmodifiableMapView(_genres);

  UnmodifiableListView<Genre> get genres =>
      UnmodifiableListView(_genres.values);

  void _initializeData() {
    _initializeGenresMap();
  }

  void _initializeGenresMap() {
    _dataRepository.genresStream().listen((genres) {
      genres.forEach((genre) => _genres[genre.id] = genre);
      notifyListeners();
    });
  }

  //Temporary
  //TODO: use this when Genre complete
  // final List<Genre> genres;
  final _genresString = [
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

  UnmodifiableListView<String> get genresString =>
      UnmodifiableListView(_genresString);

  int get activeIndex => _activeIndex;

  setActiveIndex(int newIndex) {
    _activeIndex = newIndex;
    notifyListeners();
  }
}
