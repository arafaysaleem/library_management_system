import 'dart:collection';

import 'package:flutter/material.dart';

import '../services/repositories/data_repository.dart';

import '../models/author.dart';
import '../models/book.dart';

class PublishesProvider with ChangeNotifier {
  final DataRepository _dataRepository;

  PublishesProvider({@required dataRepository}) : _dataRepository = dataRepository {
    _initializeData();
  }

  final Map<int, Author> _authors = Map();

  final Map<int, Book> _books = Map();

  void _initializeData() {
    _initializeAuthorsMap();
    _initializeBooksMap();
  }

  void _initializeAuthorsMap() {
    _dataRepository.authorsStream().listen((authors) {
      authors.forEach((author) => _authors[author.id] = author);
      notifyListeners();
    });
  }

  void _initializeBooksMap() {
    _dataRepository.booksStream().listen((books) {
      books.forEach((book) => _books[book.id] = book);
      notifyListeners();
    });
  }

  UnmodifiableMapView<int, Author> get authorsMap => UnmodifiableMapView(_authors);

  UnmodifiableListView<Author> get authors => UnmodifiableListView(_authors.values);

  UnmodifiableMapView<int, Book> get booksMap => UnmodifiableMapView(_books);

  UnmodifiableListView<Book> get books => UnmodifiableListView(_books.values);

  Book getBook(int bkId) => _books[bkId];

  Author getAuthor(int aId) => _authors[aId];

  Future<List<Author>> getBookAuthors(int bkId) async {
    List<Author> bookAuthors = [];
    //Future based
    await for (List<int> authorIds in _dataRepository.bookAuthorsStream(id: bkId)) {
      authorIds.forEach((aId) => bookAuthors.add(_authors[aId]));
    }
    //Stream based code
    // _dataRepository.bookAuthorsStream(id: bkId).listen((authorIds) {
    //   authorIds.forEach((aId) => bookAuthors.add(_authors[aId]));
    // });
    return bookAuthors;
  }

  Future<List<Book>> getAuthorBooks(int aId) async {
    List<Book> authorBooks = [];
    //Future based
    await for (List<int> bookIds in _dataRepository.authorBooksStream(id: aId)) {
      bookIds.forEach((bkId) => authorBooks.add(_books[bkId]));
    }
    //Stream based code
    // _dataRepository.authorBooksStream(id: aId).listen((authorIds) {
    //   authorIds.forEach((bkId) => authorBooks.add(_books[bkId]));
    // });
    return authorBooks;
  }

  Stream<List<Book>> getGenreBooks(int gId) {
    return _dataRepository.genreBooksStream(id: gId).map<List<Book>>((bookIds) {
      return bookIds.map(
        (bkId) {
          return _books[bkId];
        },
      ).toList();
    });
  }

  Stream<List<Book>> getTop5RatedBooks() {
    return _dataRepository.top5RatedBooksStream().map<List<Book>>((bookIds) {
      return bookIds.map(
            (bkId) {
          return _books[bkId];
        },
      ).toList();
    });
  }

  Stream<List<Book>> getTop5NewBooks() {
    return _dataRepository.top5NewBooksStream().map<List<Book>>((bookIds) {
      return bookIds.map(
            (bkId) {
          return _books[bkId];
        },
      ).toList();
    });
  }
}
