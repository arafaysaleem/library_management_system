import 'dart:collection';

import 'package:flutter/material.dart';

import '../utils/helper.dart';

import '../services/repositories/data_repository.dart';

import '../models/member.dart';

class MembersProvider with ChangeNotifier {
  final DataRepository _dataRepository;

  int _mId;

  bool _loggedIn = false;

  final Map<int, Member> _members = Map();

  UnmodifiableMapView<int, Member> get membersMap => UnmodifiableMapView(_members);

  UnmodifiableListView<Member> get members => UnmodifiableListView(_members.values);

  Member get currentMember => _members[_mId];

  bool get loggedIn => _loggedIn;

  int get currentMId => _mId;

  MembersProvider({@required dataRepository}) : _dataRepository = dataRepository {
    _initializeData();
  }

  void _initializeData() {
    _initializeMembersMap();
  }

  void _initializeMembersMap() {
    _dataRepository.membersStream().listen((members) {
      members.forEach((member) => _members[member.id] = member);
      notifyListeners();
    });
  }

 void signIn({@required String email, @required String password}) {
    _members.forEach((mId, member) {
      if (member.email == email && member.password == password) {
        _mId = member.id;
        _loggedIn = true;
        notifyListeners();
        return;
      }
    });
  }

  Future<void> signUp({
    @required String email,
    @required String password,
    @required firstName,
    @required lastName,
    @required int age,
  }) async {
    final startDate = DateTime.now();
    final bio = "New enthusiastic member";
    final newMember = {
      "m_first_name": firstName,
      "m_last_name": lastName,
      "m_age": age,
      "m_bio": bio,
      "m_start_date": Helper.dateSerializer(startDate),
      "m_email": email,
      "m_password": password,
    };

    final newMId = await _dataRepository.createAccount(data: newMember);

    //Member Object added to map
    _members[newMId] = Member(
        id: newMId,
        firstName: firstName,
        lastName: lastName,
        bio: bio,
        age: age,
        email: email,
        password: password,
        startDate: startDate);

    _mId = newMId;
    _loggedIn = true;
    notifyListeners();
  }

// void _initializeCurrentMember() {
//   _dataRepository.memberStream(id: mId).listen((currMember) {
//     _currentMember = currMember;
//     notifyListeners();
//   });
// }
}
