import 'package:flutter/foundation.dart';

import '../utils/helper.dart';
//TODO: fix jsons
class MemberAuthorReview {
  final String _text;
  final int _rating;
  final DateTime _date;
  final int _mId;
  final int _bkId;
  final String _bkName;
  final String _bkRating;
  final String _bkImageUrl;

  const MemberAuthorReview({
    @required String text,
    @required int rating,
    @required DateTime date,
    @required int mId,
    @required int bkId,
    @required String bkName,
    @required String bkRating,
    @required String bkImageUrl,
  })  : _text = text,
        _rating = rating,
        _date = date,
        _mId = mId,
        _bkId = bkId,
        _bkName = bkName,
        _bkRating = bkRating,
        _bkImageUrl = bkImageUrl;

  String get bkImageUrl => _bkImageUrl;

  String get bkRating => _bkRating;

  String get bkName => _bkName;

  int get bkId => _bkId;

  int get mId => _mId;

  DateTime get date => _date;

  int get rating => _rating;

  String get text => _text;

  factory MemberAuthorReview.fromJson(Map<String, dynamic> json) {
    return new MemberAuthorReview(
      text: json['text'] as String,
      rating: json['rating'] as int,
      date: Helper.dateDeserializer(json['date']),
      mId: json['mId'] as int,
      bkId: json['bkId'] as int,
      bkName: json['bkName'] as String,
      bkRating: json['bkRating'] as String,
      bkImageUrl: json['bkImageUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String,dynamic> data;
    data['text'] = _text;
    data['rating'] = _rating;
    data['date'] = Helper.dateSerializer(_date);
    data['mId'] = _mId;
    data['bkId'] = _bkId;
    data['bkName'] = _bkName;
    data['bkRating'] = _bkRating;
    data['bkImageUrl'] = _bkImageUrl;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemberAuthorReview &&
          runtimeType == other.runtimeType &&
          _text == other.text &&
          _date == other.date &&
          _mId == other.mId &&
          _bkId == other.bkId;

  @override
  int get hashCode =>
      _text.hashCode ^ _date.hashCode ^ _mId.hashCode ^ _bkId.hashCode;

  @override
  String toString() {
    return 'MemberAuthorReview{text: $_text, rating: $_rating, date: $_date, mId: $_mId, bkId: $_bkId, bkName: $_bkName, bkRating: $_bkRating}';
  }
}
