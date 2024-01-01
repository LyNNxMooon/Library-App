import 'package:library_app/data/vos/home_screen_vos/books_vo.dart';
import 'package:library_app/persistent/dao/library_app_hive.dart';
import 'package:stream_transform/stream_transform.dart';

class LibraryAppHiveModel {
  LibraryAppHiveModel._();
  static final LibraryAppHiveModel _singleton = LibraryAppHiveModel._();
  factory LibraryAppHiveModel() => _singleton;

  final LibraryAppDAO _libraryAppDAO = LibraryAppDAO();

  Stream<List?> get getRecentBookListStream => _libraryAppDAO
      .watchRecentBookListBox()
      .startWith(_libraryAppDAO.getRecentBookListStream)
      .map(
        (event) => _libraryAppDAO.getRecentlyViewedBooks,
      );

  Stream<List?> get getShelfStream => _libraryAppDAO
      .watchShelfBox()
      .startWith(_libraryAppDAO.getShelfStream)
      .map(
        (event) => _libraryAppDAO.getShelf,
      );

  Stream<List?> get getFavoriteBooksListStream => _libraryAppDAO
      .watchFavoriteBooksListBox()
      .startWith(_libraryAppDAO.getFavoriteBooksListStream)
      .map(
        (event) => _libraryAppDAO.getFavoriteBooksList,
      );

  //save data

  void saveRecentlyViewedList(List books) {
    _libraryAppDAO.saveRecentlyViewedBooksList(books);
  }

  void saveShelf(List shelves) {
    _libraryAppDAO.saveShelf(shelves);
  }

  void saveSearchBookQuery(String query) {
    _libraryAppDAO.saveSearchBookQuery(query);
  }

  void saveSavingBook(BooksVO book) {
    _libraryAppDAO.saveSavingBook(book);
  }

  void saveFavoriteBooksList(List books) {
    _libraryAppDAO.saveFavoriteBooksList(books);
  }

  void saveSearchHistory(List history) {
    _libraryAppDAO.saveSearchHistory(history);
  }

  //get data

  List get getRecentlyViewedBookList =>
      _libraryAppDAO.getRecentlyViewedBooks ?? [];

  String get getSearchBookQuery => _libraryAppDAO.getSearchBookQuery ?? '';

  List get getShelf => _libraryAppDAO.getShelf ?? [];

  BooksVO? get getSavingBook => _libraryAppDAO.getSavingBook;

  List get getFavoriteBooksList => _libraryAppDAO.getFavoriteBooksList ?? [];

  List get getSearchHistory => _libraryAppDAO.getSearchHistory ?? [];

  //remove data

  void removeRecentBooks() => _libraryAppDAO.removeRecentBooks();
}
