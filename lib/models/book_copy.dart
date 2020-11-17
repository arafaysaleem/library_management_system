import 'package:flutter/foundation.dart';

class BookCopy{
  final int _copyId;
  final int _bkId;

  BookCopy({@required copyId,@required bkId}) : _copyId = copyId, _bkId = bkId;

  int get copyId => _copyId;

  int get bkId => _bkId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookCopy &&
          runtimeType == other.runtimeType &&
          _copyId == other.copyId;

  @override
  int get hashCode => _copyId.hashCode;

  @override
  String toString() {
    return 'BookCopy{copyId: $_copyId, bkId: $_bkId}';
  }
}