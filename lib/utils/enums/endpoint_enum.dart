import 'package:flutter/foundation.dart';

enum EndPoint {
  BOOKS,
  AUTHORS,
  MEMBERS,
  GENRES,
  GENRE_AUTHORS,
  GENRE_BOOKS,
  GENRE_MEMBERS,
  MEMBER_PREFERENCES,
  AUTHOR_GENRES,
  BOOK_GENRES,
  AUTHOR_REVIEWS,
  BOOK_REVIEWS,
  MEMBER_AUTHOR_REVIEWS,
  MEMBER_BOOK_REVIEWS,
  BOOK_AUTHORS,
  AUTHOR_BOOKS,
  COPY_ISSUES,
  MEMBER_ISSUES,
}

extension GetEndPointPath on EndPoint {
  String get name => describeEnum(this);

  String getPath({@required String id}) {
    switch (this) {
      case EndPoint.BOOKS:
        return "books/$id";
      case EndPoint.AUTHORS:
        return "authors/$id";
      case EndPoint.MEMBERS:
        return "members/$id";
      case EndPoint.GENRES:
        return "genres/$id";
      case EndPoint.GENRE_AUTHORS:
        return "pkg/author_genres/authors/$id";
      case EndPoint.GENRE_BOOKS:
        return "pkg/book_genres/books/$id";
      case EndPoint.GENRE_MEMBERS:
        return "pkg/member_preferences/members/$id";
      case EndPoint.MEMBER_PREFERENCES:
        return "pkg/member_preferences/genres/$id";
      case EndPoint.AUTHOR_GENRES:
        return "pkg/author_genres/genres/$id";
      case EndPoint.BOOK_GENRES:
        return "pkg/book_genres/genres/$id";
      case EndPoint.AUTHOR_REVIEWS:
        return "pkg/author_reviews/members/$id";
      case EndPoint.BOOK_REVIEWS:
        return "pkg/book_reviews/members/$id";
      case EndPoint.MEMBER_AUTHOR_REVIEWS:
        return "pkg/author_reviews/authors/$id";
      case EndPoint.MEMBER_BOOK_REVIEWS:
        return "pkg/book_reviews/books/$id";
      case EndPoint.BOOK_AUTHORS:
        return "pkg/book_author_publishes/authors/$id";
      case EndPoint.AUTHOR_BOOKS:
        return "pkg/book_author_publishes/books/$id";
      case EndPoint.COPY_ISSUES:
        return "pkg/book_copies_issues/copy_id/$id";
      case EndPoint.MEMBER_ISSUES:
        return "pkg/book_copies_issues/m_id/$id";
      default:
        return throw "404";
    }
  }
}
