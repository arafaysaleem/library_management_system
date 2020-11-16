import 'package:flutter/foundation.dart';

class AuthorReview {
  final String _text;
  final int _rating;
  final DateTime _date;
  final int _aId;
  final int _mId;
  final String _mFirstName;
  final String _mLastName;
  final String _mImageUrl;

  const AuthorReview({
    @required String text,
    @required int rating,
    @required DateTime date,
    @required int aId,
    @required int mId,
    @required String mFirstName,
    @required String mLastName,
    @required String mImageUrl,
  })  : _text = text,
        _rating = rating,
        _date = date,
        _aId = aId,
        _mId = mId,
        _mFirstName = mFirstName,
        _mLastName = mLastName,
        _mImageUrl = mImageUrl;

  String get mImageUrl => _mImageUrl;

  String get mLastName => _mLastName;

  String get mFirstName => _mFirstName;

  int get mId => _mId;

  int get aId => _aId;

  DateTime get date => _date;

  int get rating => _rating;

  String get text => _text;
}
