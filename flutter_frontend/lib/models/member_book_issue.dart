import 'package:flutter/foundation.dart';

import '../utils/helper.dart';
import '../utils/enums/book_issue_status_enum.dart';

import 'book_copy.dart';

class MemberBookIssue {
  final int _issueId;
  final int _mId;
  final BookCopy _bookCopy;
  final DateTime _issueDate;
  final DateTime _dueDate;
  final DateTime _returnedDate;
  final String _bookName;
  final String _authorName;
  final String _bookImageUrl;

  const MemberBookIssue({
    @required bookName,
    @required authorName,
    @required bookImageUrl,
    @required int issueId,
    @required int mId,
    @required BookCopy bookCopy,
    @required DateTime issueDate,
    @required DateTime dueDate,
    @required DateTime returnedDate,
  })  : _issueId = issueId,
        _mId = mId,
        _bookCopy = bookCopy,
        _issueDate = issueDate,
        _dueDate = dueDate,
        _returnedDate = returnedDate,
        _bookName = bookName,
        _bookImageUrl = bookImageUrl,
        _authorName = authorName;

  factory MemberBookIssue.fromJson(Map<String, dynamic> json) {
    return new MemberBookIssue(
      issueId: json['issue_id'] as int,
      mId: json['m_id'] as int,
      bookCopy: BookCopy(copyId: json['copy_id'], bkId: json['bk_id']),
      issueDate: Helper.dateDeserializer(json['issue_date']),
      dueDate: Helper.dateDeserializer(json['due_date']),
      bookName: json['bk_name'] as String,
      authorName: json['a_name'] as String,
      bookImageUrl: json['bk_image_url'] as String,
      returnedDate:
          json['returned_date'] != null ? Helper.dateDeserializer(json['returned_date']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'issue_id': this._issueId,
      'm_id': this._mId,
      'bk_id': this._bookCopy.bkId,
      'copy_id': this._bookCopy.copyId,
      'bk_name': this._bookName,
      'a_name': this._authorName,
      'bk_image_url': this._bookImageUrl,
      'issue_date': this._issueDate,
      'due_date': this._dueDate,
      'returned_date': this._returnedDate,
    };
  }

  BookCopy get bookCopy => _bookCopy;

  int get mId => _mId;

  int get issueId => _issueId;

  DateTime get returnedDate => _returnedDate;

  DateTime get dueDate => _dueDate;

  DateTime get issueDate => _issueDate;

  BookIssueStatus get status {
    if(_returnedDate != null) return BookIssueStatus.RETURNED;
    if(_dueDate.isBefore(DateTime.now())) return BookIssueStatus.OVERDUE;
    return BookIssueStatus.DUE;
  }

  String get authorName => _authorName;

  String get bookImageUrl => _bookImageUrl;

  String get bookName => _bookName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemberBookIssue && runtimeType == other.runtimeType && _issueId == other.issueId;

  @override
  int get hashCode => _issueId.hashCode;

  @override
  String toString() {
    return 'BookCopyIssue{issueId: $_issueId, mId: $_mId, bookCopy: $_bookCopy, issueDate: $_issueDate, dueDate: $_dueDate, returnedDate: $_returnedDate, bookName: $_bookName, authorName: $_authorName}';
  }
}
