import 'package:flutter/foundation.dart';

import 'book_copy.dart';

class BookCopyIssue {
  final int _issueId;
  final int _mId;
  final BookCopy _bookCopy;
  final DateTime _issueDate;
  final DateTime _dueDate;
  final DateTime _returnedDate;

  const BookCopyIssue({
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
        _returnedDate = returnedDate;

  BookCopy get bookCopy => _bookCopy;

  int get mId => _mId;

  int get issueId => _issueId;

  DateTime get returnedDate => _returnedDate;

  DateTime get dueDate => _dueDate;

  DateTime get issueDate => _issueDate;

  bool get isReturned => _returnedDate != DateTime.parse('00-00-0000');

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookCopyIssue &&
          runtimeType == other.runtimeType &&
          _issueId == other.issueId;

  @override
  int get hashCode => _issueId.hashCode;

  @override
  String toString() {
    return 'BookCopyIssue{issueId: $_issueId, mId: $_mId, bookCopy: $_bookCopy, issueDate: $_issueDate, dueDate: $_dueDate, returnedDate: $_returnedDate}';
  }
}
