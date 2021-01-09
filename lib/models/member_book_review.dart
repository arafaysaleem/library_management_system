import 'package:flutter/foundation.dart';

import '../utils/helper.dart';

class MemberBookReview {
  final String _text;
  final int _rating;
  final DateTime _date;
  final int _mId;
  final int _aId;
  final String _aFirstName;
  final String _aLastName;
  final String _aImageUrl;

  const MemberBookReview({
    @required String text,
    @required int rating,
    @required DateTime date,
    @required int mId,
    @required int aId,
    @required String aFirstName,
    @required String aLastName,
    @required String aImageUrl,
  })  : _text = text,
        _rating = rating,
        _date = date,
        _mId = mId,
        _aId = aId,
        _aFirstName = aFirstName,
        _aLastName = aLastName,
        _aImageUrl = aImageUrl;

  String get aImageUrl => _aImageUrl;

  String get aLastName => _aLastName;

  String get aFirstName => _aFirstName;

  int get aId => _aId;

  int get mId => _mId;

  DateTime get date => _date;

  int get rating => _rating;

  String get text => _text;

  factory MemberBookReview.fromJson(Map<String, dynamic> json) {
    return new MemberBookReview(
      text: json['text'] as String,
      rating: json['rating'] as int,
      date: Helper.dateDeserializer(json['date']),
      mId: json['mId'] as int,
      aId: json['aId'] as int,
      aFirstName: json['aFirstName'] as String,
      aLastName: json['aLastName'] as String,
      aImageUrl: json['aImageUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String,dynamic> data;
    data['text'] = _text;
    data['rating'] = _rating;
    data['date'] = Helper.dateSerializer(_date);
    data['mId'] = _mId;
    data['aId'] = _aId;
    data['aFirstName'] = _aFirstName;
    data['aLastName'] = _aLastName;
    data['aImageUrl'] = _aImageUrl;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemberBookReview &&
          runtimeType == other.runtimeType &&
          _text == other.text &&
          _date == other.date &&
          _mId == other.mId &&
          _aId == other.aId;

  @override
  int get hashCode =>
      _text.hashCode ^ _date.hashCode ^ _mId.hashCode ^ _aId.hashCode;

  @override
  String toString() {
    return 'MemberBookReview{text: $_text, rating: $_rating, date: $_date, mId: $_mId, aId: $_aId, aFirstName: $_aFirstName, aLastName: $_aLastName}';
  }
}
