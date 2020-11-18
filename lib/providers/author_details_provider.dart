import 'package:flutter/material.dart';

import '../services/repositories/data_repository.dart';

import 'publishes_provider.dart';
import 'genres_provider.dart';
import 'reviews_provider.dart';

import '../models/book.dart';
import '../models/genre.dart';
import '../models/author.dart';
import '../models/author_review.dart';
import '../models/author_details.dart';

class AuthorDetailsProvider with ChangeNotifier {
  final DataRepository _dataRepository;
  final PublishesProvider _publishesProvider;
  final GenresProvider _genresProvider;
  final ReviewsProvider _reviewsProvider;

  AuthorDetailsProvider({
    @required publishesProvider,
    @required genresProvider,
    @required reviewsProvider,
    @required dataRepository,
  })  : _dataRepository = dataRepository,
        _publishesProvider = publishesProvider,
        _genresProvider = genresProvider,
        _reviewsProvider = reviewsProvider;

  /// Fetch bookDetails for bookId
  Future<AuthorDetails> getAuthorDetails(int aId) async {
    final results = await Future.wait([
      _publishesProvider.getAuthorBooks(aId),
      _genresProvider.getAuthorGenres(aId),
      _reviewsProvider.getAuthorReviews(aId)
    ]);

    /// get and store the book for bkId from _publishesProvider
    final Author author = _publishesProvider.getAuthor(aId);

    /// get and store list of Authors for bookId from _publishesProvider,
    final authorBooks = List<Book>.from(results[0]);

    /// get and store list of Genres for bookId from _genreProvider,
    final authorGenres = List<Genre>.from(results[1]);

    /// then fetch and store list of BookReviews,
    final authorReviews = List<AuthorReview>.from(results[2]);

    /// then pass these lists and book into constructor for BookDetails,
    /// store bookDetails object at bookId into _bookDetails
    return AuthorDetails(
      genres: authorGenres,
      books: authorBooks,
      reviews: authorReviews,
      author: author,
    );
  }
}
