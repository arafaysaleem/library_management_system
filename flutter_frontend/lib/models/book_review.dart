import 'package:flutter/foundation.dart';

import '../utils/helper.dart';

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

  factory BookReview.fromJson(Map<String, dynamic> json) {
    return new BookReview(
      text: json['text'] as String,
      rating: json['rating'] as int,
      date: Helper.dateDeserializer(json['date']),
      bookId: json['bookId'] as int,
      mId: json['mId'] as int,
      mFirstName: json['mFirstName'] as String,
      mLastName: json['mLastName'] as String,
      mImageUrl: json['mImageUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String,dynamic> data;
    data['text'] = _text;
    data['rating'] = _rating;
    data['date'] = Helper.dateSerializer(_date);
    data['bookId'] = _bookId;
    data['mId'] = _mId;
    data['mFirstName'] = _mFirstName;
    data['mLastName'] = _mLastName;
    data['mImageUrl'] = _mImageUrl;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookReview &&
          runtimeType == other.runtimeType &&
          _text == other.text &&
          _date == other.date &&
          _bookId == other.bookId &&
          _mId == other.mId;

  @override
  int get hashCode =>
      _text.hashCode ^ _date.hashCode ^ _bookId.hashCode ^ _mId.hashCode;

  @override
  String toString() {
    return 'BookReview{text: $_text, rating: $_rating, date: $_date, bookId: $_bookId, mId: $_mId, mFirstName: $_mFirstName, mLastName: $_mLastName}';
  }
}
