import 'package:flutter/foundation.dart';

import '../utils/helper.dart';

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

  factory AuthorReview.fromJson(Map<String, dynamic> json) {
    return new AuthorReview(
      text: json['text'] as String,
      rating: json['rating'] as int,
      date: Helper.dateDeserializer(json['date']),
      aId: json['aId'] as int,
      mId: json['mId'] as int,
      mFirstName: json['mFirstName'] as String,
      mLastName: json['mLastName'] as String,
      mImageUrl: json['mImageUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data;
    data['text'] = _text;
    data['rating'] = _rating;
    data['date'] =  Helper.dateSerializer(_date);
    data['aId'] = _aId;
    data['mId'] = _mId;
    data['mFirstName'] = _mFirstName;
    data['mLastName'] = _mLastName;
    data['mImageUrl'] = _mImageUrl;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthorReview &&
          runtimeType == other.runtimeType &&
          _text == other.text &&
          _date == other.date &&
          _aId == other.aId &&
          _mId == other.mId;

  @override
  int get hashCode =>
      _text.hashCode ^ _date.hashCode ^ _aId.hashCode ^ _mId.hashCode;

  @override
  String toString() {
    return 'AuthorReview{text: $_text, rating: $_rating, date: $_date, aId: $_aId, mId: $_mId, mFirstName: $_mFirstName, mLastName: $_mLastName}';
  }
}
