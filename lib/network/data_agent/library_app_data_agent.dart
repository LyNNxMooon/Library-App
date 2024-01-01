import 'package:library_app/data/vos/home_screen_vos/book_lists_vo.dart';
import 'package:library_app/data/vos/search_book_vos/search_book_items_vo.dart';

abstract class LibraryAppDataAgent {
  Future<List<BookListsVO>> getBookLists();
  Future<List<SearchBookItemsVO>> getSearchBooks();
}
