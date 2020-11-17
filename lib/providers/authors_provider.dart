import 'dart:collection';

import 'package:flutter/material.dart';

import '../services/repositories/data_repository.dart';

import '../models/author.dart';

class AuthorsProvider with ChangeNotifier {
  final DataRepository _dataRepository;

  AuthorsProvider({@required dataRepository})
      : _dataRepository = dataRepository {
    _initializeData();
  }

  final Map<int, Author> _authors = Map();

  UnmodifiableMapView<int, Author> get authorsMap =>
      UnmodifiableMapView(_authors);

  UnmodifiableListView<Author> get authors =>
      UnmodifiableListView(_authors.values);

  void _initializeData() {
    _initializeAuthorsMap();
  }

  void _initializeAuthorsMap() {
    _dataRepository.authorsStream().listen((authors) {
      authors.forEach((author) => _authors[author.id] = author);
      notifyListeners();
    });
  }
}
