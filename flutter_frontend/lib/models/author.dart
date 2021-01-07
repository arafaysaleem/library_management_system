class Author {
  int _id;
  int _age;
  int _rating;
  String _firstName;
  String _lastName;
  String _country;
  String _imageUrl;

  Author({
    int id,
    String firstName,
    String lastName,
    int age,
    String country,
    int rating,
    String imageUrl,
  }) {
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _age = age;
    _country = country;
    _rating = rating;
    _imageUrl = imageUrl;
  }

  int get id => _id;
  int get age => _age;
  int get rating => _rating;

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get country => _country;
  String get imageUrl => _imageUrl;

  Author.fromJson(Map<String, dynamic> json) {
    _id = json['a_id'] as int;
    _firstName = json['a_first_name'] as String;
    _lastName = json['a_last_name'] as String;
    _age = json['a_age'] as int;
    _country = json['a_country'] as String;
    _rating = json['a_rating'] as int;
    _imageUrl = json['a_image_url'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['a_id'] = _id;
    data['a_first_name'] = _firstName;
    data['a_last_name'] = _lastName;
    data['a_age'] = _age;
    data['a_country'] = _country;
    data['a_rating'] = _rating;
    data['a_image_url'] = _imageUrl;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Author && runtimeType == other.runtimeType && _id == other.id;

  @override
  int get hashCode => _id.hashCode;

  @override
  String toString() {
    return 'Author{id: $_id, age: $_age, firstName: $_firstName, lastName: $_lastName, country: $_country}';
  }
}
