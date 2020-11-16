import 'package:flutter/foundation.dart';

import 'book_review.dart';
import 'author.dart';
import 'book.dart';
import 'genre.dart';

/// Contains all book details, author details, book genres, book reviews
class BookDetails{

  ///All genres for this book
  final List<Genre> _genres;

  ///All authors for this book
  final List<Author> _authors;

  ///All reviews for this book
  final List<BookReview> _reviews;

  ///The book
  final Book _book;

  ///Published date
  final DateTime _publishedDate;

  const BookDetails({
    @required List<Genre> genres,
    @required List<Author> authors,
    @required List<BookReview> reviews,
    @required Book book,
    @required DateTime publishedDate
  })  : _genres = genres,
        _authors = authors,
        _reviews = reviews,
        _book = book,
        _publishedDate = publishedDate;

  Book get book => _book;

  List<BookReview> get reviews => _reviews;

  List<Author> get authors => _authors;

  List<Genre> get genres => _genres;

  DateTime get publishedDate => _publishedDate;
}