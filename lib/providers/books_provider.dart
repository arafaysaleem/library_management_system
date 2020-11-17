import 'dart:collection';

import 'package:flutter/material.dart';

import '../services/repositories/data_repository.dart';

import '../models/book.dart';

class BooksProvider with ChangeNotifier {
  final DataRepository _dataRepository;

  BooksProvider({@required dataRepository}) : _dataRepository = dataRepository {
    _initializeData();
  }

  final Map<int, Book> _books = Map();

  UnmodifiableMapView<int, Book> get booksMap => UnmodifiableMapView(_books);

  UnmodifiableListView<Book> get books => UnmodifiableListView(_books.values);

  UnmodifiableListView<int> get bookIds => UnmodifiableListView(_books.keys);

  void _initializeData() {
    _initializeBooksMap();
  }

  void _initializeBooksMap() {
    _dataRepository.booksStream().listen((books) {
      books.forEach((book) => _books[book.id] = book);
      notifyListeners();
    });
  }
}
