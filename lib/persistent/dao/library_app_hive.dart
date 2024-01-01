import 'package:hive/hive.dart';
import 'package:library_app/data/vos/home_screen_vos/books_vo.dart';

import 'package:library_app/persistent/hive_constant.dart';

class LibraryAppDAO {
  LibraryAppDAO._();
  static final LibraryAppDAO _singleton = LibraryAppDAO._();
  factory LibraryAppDAO() => _singleton;

  Box<List> getRecentlyViewedBookBox() =>
      Hive.box<List>(kHiveRecentlyViewedBookBox);
  Box<String> getSearchBookQueryBox() =>
      Hive.box<String>(kHiveSearchBookQueryBox);
  Box<List> getShelfBox() => Hive.box<List>(kHiveShelfBox);
  Box<BooksVO> getSavingBookBox() => Hive.box<BooksVO>(kHiveSavingBookBox);
  Box<List> getFavoriteBooksListBox() =>
      Hive.box<List>(kHiveFavoriteBooksListBox);
  Box<List> getSearchHistoryBox() => Hive.box<List>(kHiveSearchHistoryBox);

  Stream watchRecentBookListBox() => getRecentlyViewedBookBox().watch();

  Stream watchShelfBox() => getShelfBox().watch();

  Stream watchFavoriteBooksListBox() => getFavoriteBooksListBox().watch();

  Stream<List?> get getRecentBookListStream =>
      Stream.value(getRecentlyViewedBooks);

  Stream<List?> get getShelfStream => Stream.value(getShelf);

  Stream<List?> get getFavoriteBooksListStream =>
      Stream.value(getFavoriteBooksList);

  //save data

  void saveRecentlyViewedBooksList(List books) {
    getRecentlyViewedBookBox().put(kHiveRecentlyViewedBookIDKey, books);
  }

  void saveSavingBook(BooksVO book) {
    getSavingBookBox().put(kHiveBookVOTypeId, book);
  }

  void saveShelf(List shelves) {
    getShelfBox().put(kHiveShelfKey, shelves);
  }

  void saveSearchBookQuery(String query) {
    getSearchBookQueryBox().put(kHiveSearchBookQueryKey, query);
  }

  void saveFavoriteBooksList(List books) {
    getFavoriteBooksListBox().put(kHiveFavoriteBooksListKey, books);
  }

  void saveSearchHistory(List history) {
    getSearchHistoryBox().put(kHiveSearchHistoryKey, history);
  }

  //get data

  List? get getRecentlyViewedBooks =>
      getRecentlyViewedBookBox().get(kHiveRecentlyViewedBookIDKey);

  String? get getSearchBookQuery =>
      getSearchBookQueryBox().get(kHiveSearchBookQueryKey);

  List? get getShelf => getShelfBox().get(kHiveShelfKey);

  BooksVO? get getSavingBook => getSavingBookBox().get(kHiveBookVOTypeId);

  List? get getFavoriteBooksList =>
      getFavoriteBooksListBox().get(kHiveFavoriteBooksListKey);

  List? get getSearchHistory =>
      getSearchHistoryBox().get(kHiveSearchHistoryKey);

  //remove data

  void removeRecentBooks() =>
      getRecentlyViewedBookBox().delete(kHiveRecentlyViewedBookIDKey);
}
