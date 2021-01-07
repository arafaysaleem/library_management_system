import 'package:flutter/foundation.dart';

import '../utils/helper.dart';

class Book {
  int _id;
  String _name;
  int _rating;
  String _bio;
  DateTime _publishedDate;
  String _imageUrl;

  Book({
    @required int id,
    @required String name,
    @required int rating,
    @required String bio,
    @required String imageUrl,
    @required DateTime publishedDate,
  }) {
    _id = id;
    _name = name;
    _rating = rating;
    _bio = bio;
    _imageUrl = imageUrl;
    _publishedDate = publishedDate;
  }

  int get id => _id;

  int get rating => _rating;

  String get name => _name;

  String get bio => _bio;

  String get imageUrl => _imageUrl;
  
  DateTime get publishedDate => _publishedDate;

  factory Book.initialData(){
    return Book(
      id: 0,
      name: '',
      imageUrl: Helper.bookPlaceholder,
      publishedDate: null,
      rating: 0,
      bio: ''
    );
  }

  Book.fromJson(Map<String, dynamic> json) {
    _id = json['bk_id'] as int;
    _name = json['bk_name'] as String;
    _rating = json['bk_rating'] as int;
    _bio = json['bk_bio'] as String;
    _imageUrl = json['bk_image_url'] as String;
    _publishedDate = Helper.dateDeserializer(json["bk_published_date"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bk_id'] = _id;
    data['bk_name'] = _name;
    data['bk_rating'] = _rating;
    data['bk_bio'] = _bio;
    data['bk_image_url'] = _imageUrl;
    data['bk_published_date'] = Helper.dateSerializer(_publishedDate);
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book && runtimeType == other.runtimeType && _id == other.id;

  @override
  int get hashCode => _id.hashCode;

  @override
  String toString() {
    return 'Book{_id: $_id, _name: $_name, _rating: $_rating, _publishedDate: $_publishedDate}';
  }
}
