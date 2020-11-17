import 'package:flutter/foundation.dart';

import 'author_review.dart';
import 'author.dart';
import 'book.dart';
import 'genre.dart';

/// Contains all author details, book details, author genres, author reviews
class AuthorDetails {
  ///All genres for this author
  final List<Genre> _genres;

  ///All books by this author
  final List<Book> _books;

  ///All reviews for this book
  final List<AuthorReview> _reviews;

  ///The author
  final Author _author;

  const AuthorDetails({
    @required List<Genre> genres,
    @required List<Book> books,
    @required List<AuthorReview> reviews,
    @required Author author,
  })  : _genres = genres,
        _books = books,
        _reviews = reviews,
        _author = author;

  Author get author => _author;

  List<AuthorReview> get reviews => _reviews;

  List<Book> get books => _books;

  List<Genre> get genres => _genres;

  @override
  String toString() {
    return 'AuthorDetails{genres: $_genres, books: $_books, reviews: $_reviews, author: $_author}';
  }
}
