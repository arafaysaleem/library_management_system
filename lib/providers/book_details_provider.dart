import 'package:flutter/material.dart';

import 'publishes_provider.dart';
import 'genres_provider.dart';
import 'reviews_provider.dart';

import '../models/book.dart';
import '../models/genre.dart';
import '../models/author.dart';
import '../models/book_review.dart';
import '../models/book_details.dart';

class BookDetailsProvider with ChangeNotifier {
  final PublishesProvider _publishesProvider;
  final GenresProvider _genresProvider;
  final ReviewsProvider _reviewsProvider;

  BookDetailsProvider({
    @required publishesProvider,
    @required genresProvider,
    @required reviewsProvider,
  })  : _publishesProvider = publishesProvider,
        _genresProvider = genresProvider,
        _reviewsProvider = reviewsProvider;

  /// Fetch bookDetails for bookId
  Future<BookDetails> getBookDetails(int bkId) async {
    final results = await Future.wait([
      _publishesProvider.getBookAuthors(bkId),
      _genresProvider.getBookGenres(bkId),
      _reviewsProvider.getBookReviews(bkId)
    ]);

    /// get and store the book for bkId from _publishesProvider
    final Book book = _publishesProvider.getBook(bkId);

    /// get and store list of Authors for bookId from _publishesProvider,
    final bookAuthors = List<Author>.from(results[0]);

    /// get and store list of Genres for bookId from _genreProvider,
    final bookGenres = List<Genre>.from(results[1]);

    /// then fetch and store list of BookReviews,
    final bookReviews = List<BookReview>.from(results[2]);

    /// then pass these lists and book into constructor for BookDetails,
    /// store bookDetails object at bookId into _bookDetails
    return BookDetails(
      genres: bookGenres,
      authors: bookAuthors,
      reviews: bookReviews,
      book: book,
    );
  }
}
