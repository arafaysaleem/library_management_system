import 'package:flutter/material.dart';

import '../services/repositories/data_repository.dart';

import '../models/book_review.dart';
import '../models/author_review.dart';

class ReviewsProvider with ChangeNotifier {
  final DataRepository _dataRepository;

  ReviewsProvider({@required dataRepository}) : _dataRepository = dataRepository;

  Future<List<BookReview>> getBookReviews(int bkId) async {
    List<BookReview> bookReviews=[];
    //Future based
    await for (List<BookReview> bkReviews in _dataRepository.bookReviewsStream(id: bkId)) {
      bookReviews.addAll(bkReviews);
    }
    //Stream based
    // _dataRepository.bookReviewsStream(id: bkId).listen((bkReviews) {
    //   bookReviews.addAll(bkReviews);
    // });
    return bookReviews;
  }

  Future<List<AuthorReview>> getAuthorReviews(int aId) async {
    List<AuthorReview> authorReviews=[];
    //Future based
    await for (List<AuthorReview> aReviews in _dataRepository.authorReviewsStream(id: aId)) {
      authorReviews.addAll(aReviews);
    }
    //Stream based
    // _dataRepository.bookReviewsStream(id: bkId).listen((bkReviews) {
    //   bookReviews.addAll(bkReviews);
    // });
    return authorReviews;
  }
}
