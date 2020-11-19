import 'package:flutter/foundation.dart';

class BookCopy{
  final int _copyId;
  final int _bkId;

  BookCopy({@required copyId,@required bkId}) : _copyId = copyId, _bkId = bkId;

  factory BookCopy.fromJson(Map<String, dynamic> json) {
    return new BookCopy(
      copyId: json['copy_id'] as int,
      bkId: json['bk_id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'copy_id': this._copyId,
      'bk_id': this._bkId,
    };
  }

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