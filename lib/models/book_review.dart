import 'package:flutter/foundation.dart';

class BookReview {
  final String _text;
  final int _rating;
  final DateTime _date;
  final int _bookId;
  final int _mId;
  final String _mFirstName;
  final String _mLastName;
  final String _mImageUrl;

  const BookReview({
    @required String text,
    @required int rating,
    @required DateTime date,
    @required int bookId,
    @required int mId,
    @required String mFirstName,
    @required String mLastName,
    @required String mImageUrl,
  })  : _text = text,
        _rating = rating,
        _date = date,
        _bookId = bookId,
        _mId = mId,
        _mFirstName = mFirstName,
        _mLastName = mLastName,
        _mImageUrl = mImageUrl;

  String get mImageUrl => _mImageUrl;

  String get mLastName => _mLastName;

  String get mFirstName => _mFirstName;

  int get mId => _mId;

  int get bookId => _bookId;

  DateTime get date => _date;

  int get rating => _rating;

  String get text => _text;
}
