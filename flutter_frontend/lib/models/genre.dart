class Genre {
  int _id;
  String _name;

  Genre({int id, String name}) {
    _id = id;
    _name = name;
  }

  int get id => _id;

  String get name => _name;

  Genre.fromJson(Map<String, dynamic> json) {
    _id = json['g_id'] as int;
    _name = json['g_name'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['g_id'] = _id;
    data['g_name'] = _name;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Genre && runtimeType == other.runtimeType && _id == other.id;

  @override
  int get hashCode => _id.hashCode;

  @override
  String toString() {
    return 'Genre{id: $_id, name: $_name}';
  }
}
