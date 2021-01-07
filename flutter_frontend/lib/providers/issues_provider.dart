import 'dart:collection';

import 'package:flutter/material.dart';

import '../services/repositories/data_repository.dart';

import '../utils/helper.dart';

import '../models/book_copy.dart';
import '../models/book_details.dart';
import '../models/member_book_issue.dart';

class IssuesProvider with ChangeNotifier {
  final DataRepository _dataRepository;

  final Map<int, MemberBookIssue> _memberIssues = Map();

  final int currentMId;

  // CopyID: MemberBookIssue
  UnmodifiableMapView<int, MemberBookIssue> get memberIssuesMap => UnmodifiableMapView(_memberIssues);

  UnmodifiableListView<MemberBookIssue> get memberIssues => UnmodifiableListView(_memberIssues.values.toList().reversed);

  IssuesProvider({@required dataRepository, @required this.currentMId}) : _dataRepository = dataRepository {
    //TODO: Fetch m_id from authProvider
    _initializeMemberBookIssues();
  }

  void _initializeMemberBookIssues() {
    _dataRepository.memberBookIssuesStream(id: currentMId).listen((mBIssues) {
      mBIssues.forEach((issue) => _memberIssues[issue.bookCopy.copyId] = issue);
      notifyListeners();
    });
  }

  /*List<MemberBookIssue> getBookMemberIssues(int bkId) {
    List<MemberBookIssue> bMIssues=[];
    _dataRepository.bookMemberIssuesStream(id: bkId).listen((bMIssues) {
      bMIssues.forEach(bMIssues.add);
    });
    return bMIssues;
  }*/

  Future<int> _getAvailableBookCopy(int bookId) async {
    await for(List<BookCopy> bookCopies in _dataRepository.bookCopiesStream(id: bookId)){
      for(BookCopy bookCopy in bookCopies){
        if(_memberIssues.containsKey(bookCopy.copyId)) continue;
        int count = await _dataRepository.copyIssuesCount(id: bookCopy.copyId);
        if (count == 0) return bookCopy.copyId;
      }
    }
    return -1;
  }

  //Books are issued for a month by default
  Future<bool> issueBook(int bkId, BookDetails bookDetails, {int monthsIssued = 1}) async {
    int copyId = await _getAvailableBookCopy(bkId);
    print("Available copy: $copyId");
    if (copyId == -1) return false;
    final issueDate = DateTime.now();
    final dueDate = issueDate.add(Duration(days: 30 * monthsIssued));
    print(Helper.dateSerializer(issueDate));
    //Response data
    final issueId = await _dataRepository.addBookIssue(data: {
      "m_id": currentMId,
      "copy_id": copyId,
      "issue_date": Helper.dateSerializer(issueDate),
      "due_date": Helper.dateSerializer(dueDate),
    });

    //MemberBookIssue Object added to map
    _memberIssues[copyId] = MemberBookIssue(
      bookName: bookDetails.book.name,
      authorName: "${bookDetails.authors[0].firstName} ${bookDetails.authors[0].lastName}",
      bookImageUrl: bookDetails.book.imageUrl,
      issueId: issueId,
      mId: currentMId,
      bookCopy: BookCopy(bkId: bkId, copyId: copyId),
      issueDate: issueDate,
      dueDate: dueDate,
      returnedDate: null,
    );

    notifyListeners();
    print(_memberIssues[copyId]);
    return true;
  }
}
