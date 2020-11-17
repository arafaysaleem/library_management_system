class Book {
  int _id;
  String _name;
  int _rating;
  String _bio;
  String _imageUrl;

  Book({
    int id,
    String name,
    int rating,
    String bio,
    String imageUrl,
  }) {
    _id = id;
    _name = name;
    _rating = rating;
    _bio = bio;
    _imageUrl = imageUrl;
  }

  int get id => _id;

  int get rating => _rating;

  String get name => _name;

  String get bio => _bio;

  String get imageUrl => _imageUrl;

  Book.fromJson(Map<String, dynamic> json) {
    _id = json['bk_id'];
    _name = json['bk_name'];
    _rating = json['bk_rating'];
    _bio = json['bk_bio'];
    _imageUrl = json['bk_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bk_id'] = _id;
    data['bk_name'] = _name;
    data['bk_rating'] = _rating;
    data['bk_bio'] = _bio;
    data['bk_image_url'] = _imageUrl;
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
    return 'Book{id: $_id, name: $_name, imageUrl: $_imageUrl}';
  }
}
