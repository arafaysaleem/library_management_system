import '../utils/helper.dart';

class Member {
  int _id;
  String _firstName;
  String _lastName;
  String _bio;
  DateTime _startDate;
  int _age;
  String _imageUrl;

  Member({
    int id,
    String bio,
    DateTime startDate,
    int age,
    String imageUrl,
  }) {
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _bio = bio;
    _startDate = startDate;
    _age = age;
    _imageUrl = imageUrl;
  }

  int get id => _id;

  String get firstName => _firstName;

  String get lastName => _lastName;

  String get bio => _bio;

  DateTime get startDate => _startDate;

  int get age => _age;

  String get imageUrl => _imageUrl;

  Member.fromJson(Map<String, dynamic> json) {
    _id = json['m_id'] as int;
    _firstName = json['m_first_name'] as String;
    _lastName = json['m_last_name'] as String;
    _bio = json['m_bio'] as String;
    _startDate = Helper.dateDeserializer(json['m_start_date']);
    _age = json['m_age'] as int;
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
    data['m_image_url'] = _imageUrl;
    return data;
  }
}
