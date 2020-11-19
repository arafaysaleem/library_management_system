import 'package:flutter/foundation.dart';

import '../networking/api_service.dart';

import '../../utils/enums/endpoint_enum.dart';

import 'interface_data_repository.dart';

import '../../models/author.dart';
import '../../models/book.dart';
import '../../models/genre.dart';
import '../../models/member.dart';
import '../../models/author_review.dart';
import '../../models/book_review.dart';
import '../../models/member_author_review.dart';
import '../../models/member_book_review.dart';

class DataRepository implements IDataRepository {
  DataRepository._();

  /// Singleton instance of a ApiService class.
  static final instance = DataRepository._();

  final ApiService _apiService = ApiService.instance;

  Stream<List<Book>> booksStream() {
    return _apiService.collectionStream<Book>(
      endPoint: EndPoint.BOOKS,
      builder: (data) => Book.fromJson(data),
    );
  }

  Stream<List<Author>> authorsStream() {
    return _apiService.collectionStream<Author>(
      endPoint: EndPoint.AUTHORS,
      builder: (data) => Author.fromJson(data),
    );
  }

  Stream<List<Genre>> genresStream() {
    return _apiService.collectionStream<Genre>(
      endPoint: EndPoint.GENRES,
      builder: (data) => Genre.fromJson(data),
    );
  }

  Stream<List<Member>> membersStream() {
    return _apiService.collectionStream<Member>(
      endPoint: EndPoint.MEMBERS,
      builder: (data) => Member.fromJson(data),
    );
  }

  Stream<Author> authorStream({@required int id}) {
    return _apiService.documentStream(
      endPoint: EndPoint.AUTHORS,
      id: id.toString(),
      builder: (data) => Author.fromJson(data),
    );
  }

  Stream<Book> bookStream({@required int id}) {
    return _apiService.documentStream(
      endPoint: EndPoint.BOOKS,
      id: id.toString(),
      builder: (data) => Book.fromJson(data),
    );
  }

  Stream<Member> memberStream({@required int id}) {
    return _apiService.documentStream(
      endPoint: EndPoint.MEMBERS,
      id: id.toString(),
      builder: (data) => Member.fromJson(data),
    );
  }

  // This fetches a list of ids which are used in the provider to
  // look for relevant object instances. This provides type safety.
  // Alternate: Can also return a Map of provided details and use
  // it directly in UI.

  Stream<List<int>> genreAuthorsStream({@required int id}) {
    return _apiService.collectionStream<int>(
      endPoint: EndPoint.GENRE_AUTHORS,
      id: id.toString(),
      builder: (data) => data["a_id"],
    );
  }

  Stream<List<int>> genreBooksStream({@required int id}) {
    return _apiService.collectionStream<int>(
      endPoint: EndPoint.GENRE_BOOKS,
      id: id.toString(),
      builder: (data) => data["bk_id"],
    );
  }

  Stream<List<int>> genreMembersStream({@required int id}) {
    return _apiService.collectionStream<int>(
      endPoint: EndPoint.GENRE_MEMBERS,
      id: id.toString(),
      builder: (data) => data["m_id"],
    );
  }

  /// Returns a list of genre Ids which are used in provider to
  /// search and retrieve a list of Genre objects.
  /// Alternate: Can also return a Map or a list of genre names

  Stream<List<int>> authorGenresStream({@required int id}) {
    return _apiService.collectionStream<int>(
      endPoint: EndPoint.AUTHOR_GENRES,
      id: id.toString(),
      builder: (data) => data["g_id"],
    );
  }

  Stream<List<int>> bookGenresStream({@required int id}) {
    return _apiService.collectionStream<int>(
      endPoint: EndPoint.BOOK_GENRES,
      id: id.toString(),
      builder: (data) => data["g_id"],
    );
  }

  Stream<List<int>> memberGenresStream({@required int id}) {
    return _apiService.collectionStream<int>(
      endPoint: EndPoint.MEMBER_PREFERENCES,
      id: id.toString(),
      builder: (data) => data["g_id"],
    );
  }

  Stream<List<AuthorReview>> authorReviewsStream({@required int id}) {
    return _apiService.collectionStream<AuthorReview>(
      endPoint: EndPoint.AUTHOR_REVIEWS,
      id: id.toString(),
      builder: (data) => AuthorReview.fromJson(data),
    );
  }

  Stream<List<BookReview>> bookReviewsStream({@required int id}) {
    return _apiService.collectionStream<BookReview>(
      endPoint: EndPoint.BOOK_REVIEWS,
      id: id.toString(),
      builder: (data) => BookReview.fromJson(data),
    );
  }

  Stream<List<MemberBookReview>> memberBookReviewsStream({@required int id}) {
    return _apiService.collectionStream<MemberBookReview>(
      endPoint: EndPoint.MEMBER_BOOK_REVIEWS,
      id: id.toString(),
      builder: (data) => MemberBookReview.fromJson(data),
    );
  }

  Stream<List<MemberAuthorReview>> memberAuthorReviewsStream({@required int id}) {
    return _apiService.collectionStream<MemberAuthorReview>(
      endPoint: EndPoint.MEMBER_AUTHOR_REVIEWS,
      id: id.toString(),
      builder: (data) => MemberAuthorReview.fromJson(data),
    );
  }

  Stream<List<int>> bookAuthorsStream({@required int id}) {
    return _apiService.collectionStream<int>(
      endPoint: EndPoint.BOOK_AUTHORS,
      id: id.toString(),
      builder: (data) => data["a_id"],
    );
  }

  Stream<List<int>> authorBooksStream({@required int id}) {
    return _apiService.collectionStream<int>(
      endPoint: EndPoint.AUTHOR_BOOKS,
      id: id.toString(),
      builder: (data) => data["bk_id"],
    );
  }

  Stream<List<int>> top5RatedBooksStream() {
    return _apiService.collectionStream<int>(
      endPoint: EndPoint.TOP5RATED_BOOKS,
      builder: (data) => data["bk_id"],
    );
  }

  Stream<List<int>> top5NewBooksStream() {
    return _apiService.collectionStream<int>(
      endPoint: EndPoint.TOP5NEW_BOOKS,
      builder: (data) => data["bk_id"],
    );
  }
}
