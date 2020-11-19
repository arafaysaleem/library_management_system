import '../utils/helper.dart';

class Member {
  int _id;
  String _firstName;
  String _lastName;
  String _bio;
  DateTime _startDate;
  int _age;
  String _imageUrl;
  String _email;
  String _password;

  Member({
    int id,
    String bio,
    DateTime startDate,
    int age,
    String firstName,
    String lastName,
    String imageUrl,
    String email,
    String password,
  }) {
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _bio = bio;
    _startDate = startDate;
    _age = age;
    _imageUrl = imageUrl;
    _email = email;
    _password = password;
  }

  String get email => _email;

  String get password => _password;

  int get id => _id;

  String get firstName => _firstName;

  String get lastName => _lastName;

  String get bio => _bio;

  DateTime get startDate => _startDate;

  int get age => _age;

  String get imageUrl => _imageUrl;

  bool get hasImage => _imageUrl != null;

  Member copyWith({
    int id,
    String firstName,
    String lastName,
    String bio,
    DateTime startDate,
    int age,
    String imageUrl,
    String email,
    String password,
  }) {
    return Member(
      id: id ?? this._id,
      firstName: firstName ?? this._firstName,
      lastName: lastName ?? this._lastName,
      bio: bio ?? this._bio,
      startDate: startDate ?? this._startDate,
      age: age ?? this._age,
      imageUrl: imageUrl ?? this._imageUrl,
      email: email ?? this._email,
      password: password ?? this._password,
    );
  }

  Member.fromJson(Map<String, dynamic> json) {
    _id = json['m_id'] as int;
    _firstName = json['m_first_name'] as String;
    _lastName = json['m_last_name'] as String;
    _bio = json['m_bio'] as String;
    _startDate = Helper.dateDeserializer(json['m_start_date']);
    _age = json['m_age'] as int;
    _email = json['m_email'] as String;
    _password = json['m_password'] as String;
    _imageUrl = json['m_image_url'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['m_id'] = _id;
    data['m_first_name'] = _firstName;
    data['m_last_name'] = _lastName;
    data['m_bio'] = _bio;
    data['m_start_date'] = Helper.dateSerializer(_startDate);
    data['m_age'] = _age;
    data['m_email'] = _email;
    data['m_password'] = _password;
    data['m_image_url'] = _imageUrl;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Member && runtimeType == other.runtimeType && _id == other.id;

  @override
  int get hashCode => _id.hashCode;

  @override
  String toString() {
    return 'Member{id: $_id, email: $_email,firstName: $_firstName, lastName: $_lastName, startDate: $_startDate, age: $_age}';
  }
}
