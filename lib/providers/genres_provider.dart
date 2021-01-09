import 'dart:collection';

import 'package:flutter/material.dart';

import '../services/repositories/data_repository.dart';

import '../models/genre.dart';

class GenresProvider with ChangeNotifier {
  final DataRepository _dataRepository;

  GenresProvider({@required dataRepository}) : _dataRepository = dataRepository {
    _initializeData();
  }

  final Map<int, Genre> _genres = Map();

  UnmodifiableMapView<int, Genre> get genresMap => UnmodifiableMapView(_genres);

  UnmodifiableListView<Genre> get genres => UnmodifiableListView(_genres.values);

  int get activeGenreId => genres[_activeIndex].id;

  void _initializeData() {
    _initializeGenresMap();
  }

  void _initializeGenresMap() {
    _dataRepository.genresStream().listen((genres) {
      genres.forEach((genre) => _genres[genre.id] = genre);
      notifyListeners();
    });
  }

  int _activeIndex = 0;

  int get activeIndex => _activeIndex;

  bool isActiveIndex(int i) => _activeIndex == i;

  setActiveIndex(int newIndex) {
    _activeIndex = newIndex;
    notifyListeners();
  }

  Future<List<Genre>> getBookGenres(int bkId) async {
    List<Genre> bookGenres=[];
    //Future based
    await for (List<int> genreIds in _dataRepository.bookGenresStream(id: bkId)) {
      genreIds.forEach((gId) => bookGenres.add(_genres[gId]));
    }
    //Stream based code
    //_dataRepository.bookGenresStream(id: bkId).forEach((gId) => bookGenres.add(_genres[gId]));
    return bookGenres;
  }

  Future<List<Genre>> getAuthorGenres(int aId) async {
    List<Genre> authorGenres=[];
    //Future based
    await for (List<int> genreIds in _dataRepository.authorGenresStream(id: aId)) {
      genreIds.forEach((gId) => authorGenres.add(_genres[gId]));
    }
    //Stream based code
    //_dataRepository.bookGenresStream(id: bkId).forEach((gId) => bookGenres.add(_genres[gId]));
    return authorGenres;
  }

  Future<List<Genre>> getMemberGenres(int mId) async {
    List<Genre> memberGenres=[];
    //Future based
    await for (List<int> genreIds in _dataRepository.memberGenresStream(id: mId)) {
      genreIds.forEach((gId) => memberGenres.add(_genres[gId]));
    }
    //Stream based code
    //_dataRepository.bookGenresStream(id: bkId).forEach((gId) => bookGenres.add(_genres[gId]));
    return memberGenres;
  }
}
