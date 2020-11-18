import 'package:flutter/material.dart';

import 'publishes_provider.dart';
import 'genres_provider.dart';
import 'reviews_provider.dart';

import '../models/book.dart';
import '../models/genre.dart';
import '../models/author.dart';
import '../models/author_review.dart';
import '../models/author_details.dart';

class AuthorDetailsProvider with ChangeNotifier {
  final PublishesProvider _publishesProvider;
  final GenresProvider _genresProvider;
  final ReviewsProvider _reviewsProvider;

  AuthorDetailsProvider({
    @required publishesProvider,
    @required genresProvider,
    @required reviewsProvider,
  })  : _publishesProvider = publishesProvider,
        _genresProvider = genresProvider,
        _reviewsProvider = reviewsProvider;

  /// Fetch bookDetails for bookId
  Future<AuthorDetails> getAuthorDetails(int aId) async {
    List<Book> authorBooks;
    List<Genre> authorGenres;
    List<AuthorReview> authorReviews;
    final Author author = _publishesProvider.getAuthor(aId);

    await Future.wait<void>([
      (() async => authorBooks = await _publishesProvider.getAuthorBooks(aId))(),
      (() async => authorGenres = await _genresProvider.getAuthorGenres(aId))(),
      (() async => authorReviews = await _reviewsProvider.getAuthorReviews(aId))(),
    ]);

    return AuthorDetails(
      genres: authorGenres,
      books: authorBooks,
      reviews: authorReviews,
      author: author,
    );
  }
}
