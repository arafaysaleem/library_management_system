import 'package:flutter/foundation.dart';

class BookCopy{
  final int _copyId;
  final int _bkId;

  BookCopy({@required copyId,@required bkId}) : _copyId = copyId, _bkId = bkId;

  int get copyId => _copyId;

  int get bkId => _bkId;
}