import 'dart:collection';

import 'package:flutter/material.dart';

import '../services/repositories/data_repository.dart';

import 'authors_provider.dart';
import 'books_provider.dart';
import 'genres_provider.dart';

import '../models/book_review.dart';
import '../models/book_details.dart';

class BookDetailsProvider with ChangeNotifier {
  final DataRepository _dataRepository;
  final AuthorsProvider _authorsProvider;
  final BooksProvider _booksProvider;
  final GenresProvider _genresProvider;

  BookDetailsProvider(
      {authorsProvider,
      booksProvider,
      genresProvider,
      @required dataRepository})
      : _dataRepository = dataRepository,
        _booksProvider = booksProvider,
        _authorsProvider = authorsProvider,
        _genresProvider = genresProvider {
    _initializeData();
  }

  //initialise with db
  final Map<int, BookDetails> _bookDetails = Map();

  UnmodifiableMapView<int, BookDetails> get bookDetailsMap =>
      UnmodifiableMapView(_bookDetails);

  UnmodifiableListView<BookDetails> get bookDetails =>
      UnmodifiableListView(_bookDetails.values);

  void _initializeData() {
    _initializeBookDetailsMap();
  }

  /// Stream based methods
  void _initializeBookDetailsMap() {
    /// Iterate over _booksProvider.books,
    /// fetch list of authorIds for each bookId using dataRepo,
    /// get and store list of Authors for authorIds from _authorsProvider,
    /// then fetch list of genreIds for each bookId using dataRepo,
    /// get and store list of Genres for genreIds from _genreProvider,
    /// then fetch and store list of BookReviews from dataRepo,
    /// then pass these lists and book into constructor for BookDetails,
    /// store bookDetails object at bookId into _bookDetails
  }
}
