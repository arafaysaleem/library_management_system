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
  MEMBER_PREFS_TABLE,
  AUTHOR_GENRES,
  BOOK_GENRES,
  AUTHOR_REVIEWS,
  BOOK_REVIEWS,
  MEMBER_AUTHOR_REVIEWS,
  MEMBER_BOOK_REVIEWS,
  BOOK_AUTHORS,
  AUTHOR_BOOKS,
  TOP5RATED_BOOKS,
  TOP5NEW_BOOKS,
  BOOK_MEMBER_ISSUES,
  MEMBER_BOOK_ISSUES,
  BOOK_COPIES_ISSUES,
  BOOK_COPIES,
  COPY_ISSUES_COUNT,
  SIGN_UP,
}

extension GetEndPointPath on EndPoint {
  String get name => describeEnum(this);

  String get package => "pkg";

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
        return "$package/author_genres/authors/$id";
      case EndPoint.GENRE_BOOKS:
        return "$package/book_genres/books/$id";
      case EndPoint.GENRE_MEMBERS:
        return "$package/member_preferences/members/$id";
      case EndPoint.MEMBER_PREFERENCES:
        return "$package/member_preferences/genres/$id";
      case EndPoint.AUTHOR_GENRES:
        return "$package/author_genres/genres/$id";
      case EndPoint.BOOK_GENRES:
        return "$package/book_genres/genres/$id";
      case EndPoint.AUTHOR_REVIEWS:
        return "$package/author_reviews/members/$id";
      case EndPoint.BOOK_REVIEWS:
        return "$package/book_reviews/members/$id";
      case EndPoint.MEMBER_AUTHOR_REVIEWS:
        return "$package/author_reviews/authors/$id";
      case EndPoint.MEMBER_BOOK_REVIEWS:
        return "$package/book_reviews/books/$id";
      case EndPoint.BOOK_AUTHORS:
        return "$package/book_author_publishes/authors/$id";
      case EndPoint.AUTHOR_BOOKS:
        return "$package/book_author_publishes/books/$id";
      case EndPoint.TOP5RATED_BOOKS:
        return "$package/book_top_5_rated/";
      case EndPoint.TOP5NEW_BOOKS:
        return "$package/book_new_5_collection/";
      case EndPoint.BOOK_MEMBER_ISSUES:
        return "$package/book_copies_issues/bk_id/$id";
      case EndPoint.MEMBER_BOOK_ISSUES:
        return "$package/book_copies_issues/m_id/$id";
      case EndPoint.COPY_ISSUES_COUNT:
        return "$package/book_copies_issues/copy_id/$id";
      case EndPoint.BOOK_COPIES:
        return "$package/book_copies/$id";
      case EndPoint.BOOK_COPIES_ISSUES:
        return "book_copies_issues/";
      case EndPoint.MEMBER_PREFS_TABLE:
        return "member_preferences/$id";
      default:
        return throw "404";
    }
  }
}
