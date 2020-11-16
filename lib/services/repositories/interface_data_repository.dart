import '../../models/author.dart';
import '../../models/book.dart';
import '../../models/genre.dart';
import '../../models/member.dart';
import '../../models/author_review.dart';
import '../../models/book_review.dart';
import '../../models/member_author_review.dart';
import '../../models/member_book_review.dart';

abstract class IDataRepository{
  Future<List<Book>> getAllBooks();
  Future<List<Author>> getAllAuthors();
  Future<List<Genre>> getAllGenres();
  Future<List<Member>> getAllMembers();
  Future<Author> getAuthor(int id);
  Future<Book> getBook(int id);
  Future<Member> getMember(int id);
  Future<List<int>> getAuthorIdsByGenre(int id);
  Future<List<int>> getBookIdsByGenre(int id);
  Future<List<int>> getMemberIdsByGenre(int id);
  Future<List<int>> getMemberGenres(int id);
  Future<List<int>> getAuthorGenres(int id);
  Future<List<int>> getBookGenres(int id);
  Future<List<AuthorReview>> getAuthorReviews(int id);
  Future<List<BookReview>> getBookReviews(int id);
  Future<List<MemberBookReview>> getMemberBookReviews(int id);
  Future<List<MemberAuthorReview>> getMemberAuthorReviews(int id);
}