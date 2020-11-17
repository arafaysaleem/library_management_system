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

  @override
  Future<Author> getAuthor(int id) async {
    final List<dynamic> items =
        await _apiService.getEndPointData(EndPoint.AUTHORS, id: id.toString());
    return Author.fromJson(items[0]);
  }

  @override
  Future<Book> getBook(int id) async {
    final List<dynamic> items =
        await _apiService.getEndPointData(EndPoint.BOOKS, id: id.toString());
    return Book.fromJson(items[0]);
  }

  @override
  Future<Member> getMember(int id) async {
    final List<dynamic> items =
        await _apiService.getEndPointData(EndPoint.MEMBERS, id: id.toString());
    return Member.fromJson(items[0]);
  }

  // This fetches a list of ids which are used in the provider to
  // look for relevant object instances. This provides type safety.
  // Alternate: Can also return a Map of provided details and use
  // it directly in UI.
  @override
  Future<List<int>> getAuthorIdsByGenre(int id) async {
    final List<dynamic> items =
        await _apiService.getEndPointData(EndPoint.GENRE_AUTHORS, id: id.toString());
    List<int> authorIds;
    items.forEach((json) => authorIds.add(json["a_id"]));
    return authorIds;
  }

  @override
  Future<List<int>> getBookIdsByGenre(int id) async {
    final List<dynamic> items =
        await _apiService.getEndPointData(EndPoint.GENRE_BOOKS, id: id.toString());
    List<int> bookIds;
    items.forEach((json) => bookIds.add(json["bk_id"]));
    return bookIds;
  }

  @override
  Future<List<int>> getMemberIdsByGenre(int id) async {
    final List<dynamic> items =
        await _apiService.getEndPointData(EndPoint.GENRE_MEMBERS, id: id.toString());
    List<int> memberIds;
    items.forEach((json) => memberIds.add(json["m_id"]));
    return memberIds;
  }

  /// Returns a list of genre Ids which are used in provider to
  /// search and retrieve a list of Genre objects.
  /// Alternate: Can also return a Map or a list of genre names
  @override
  Future<List<int>> getAuthorGenres(int id) async {
    final List<dynamic> items =
        await _apiService.getEndPointData(EndPoint.AUTHOR_GENRES, id: id.toString());
    List<int> genreIds;
    items.forEach((json) => genreIds.add(json["g_id"]));
    return genreIds;
  }

  @override
  Future<List<int>> getBookGenres(int id) async {
    final List<dynamic> items =
        await _apiService.getEndPointData(EndPoint.BOOK_GENRES, id: id.toString());
    List<int> genreIds;
    items.forEach((json) => genreIds.add(json["g_id"]));
    return genreIds;
  }

  @override
  Future<List<int>> getMemberGenres(int id) async {
    final List<dynamic> items =
        await _apiService.getEndPointData(EndPoint.MEMBER_PREFERENCES, id: id.toString());
    List<int> genreIds;
    items.forEach((json) => genreIds.add(json["g_id"]));
    return genreIds;
  }

  @override
  Future<List<AuthorReview>> getAuthorReviews(int id) async {
    final List<dynamic> items =
        await _apiService.getEndPointData(EndPoint.AUTHOR_REVIEWS, id: id.toString());
    List<AuthorReview> authorReviews;
    items.forEach((json) => authorReviews.add(AuthorReview.fromJson(json)));
    return authorReviews;
  }

  @override
  Future<List<BookReview>> getBookReviews(int id) async {
    final List<dynamic> items =
        await _apiService.getEndPointData(EndPoint.BOOK_REVIEWS, id: id.toString());
    List<BookReview> bookReviews;
    items.forEach((json) => bookReviews.add(BookReview.fromJson(json)));
    return bookReviews;
  }

  @override
  Future<List<MemberBookReview>> getMemberBookReviews(int id) async {
    final List<dynamic> items = await _apiService
        .getEndPointData(EndPoint.MEMBER_BOOK_REVIEWS, id: id.toString());
    List<MemberBookReview> memberBookReviews;
    items.forEach(
        (json) => memberBookReviews.add(MemberBookReview.fromJson(json)));
    return memberBookReviews;
  }

  @override
  Future<List<MemberAuthorReview>> getMemberAuthorReviews(int id) async {
    final List<dynamic> items = await _apiService
        .getEndPointData(EndPoint.MEMBER_AUTHOR_REVIEWS, id: id.toString());
    List<MemberAuthorReview> memberAuthorReviews;
    items.forEach(
        (json) => memberAuthorReviews.add(MemberAuthorReview.fromJson(json)));
    return memberAuthorReviews;
  }
}
