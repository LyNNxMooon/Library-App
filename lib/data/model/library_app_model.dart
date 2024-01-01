import 'package:library_app/data/vos/home_screen_vos/book_lists_vo.dart';
import 'package:library_app/data/vos/search_book_vos/search_book_items_vo.dart';
import 'package:library_app/network/data_agent/library_app_data_agent.dart';
import 'package:library_app/network/data_agent/library_app_data_agent_impl.dart';

class LibraryAppModel {
  LibraryAppModel._();
  static final LibraryAppModel _singleton = LibraryAppModel._();
  factory LibraryAppModel() => _singleton;

  final LibraryAppDataAgent _libraryAppDataAgent = LibraryAppDataAgentImpl();

  Future<List<BookListsVO>> getAllBookLists() =>
      _libraryAppDataAgent.getBookLists();

  Future<List<SearchBookItemsVO>> getAllSearchBooks() =>
      _libraryAppDataAgent.getSearchBooks().then((value) {
        var temp = value;
        temp = temp.map((e) {
          e.volumeInfo?.imageLinks?.smallThumbnail = (e
                      .volumeInfo?.imageLinks?.smallThumbnail?.isEmpty ??
                  true)
              ? "https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Black_colour.jpg/800px-Black_colour.jpg"
              : e.volumeInfo?.imageLinks?.smallThumbnail;
          e.volumeInfo?.title = (e.volumeInfo?.title?.isEmpty ?? true)
              ? "Unknown"
              : e.volumeInfo?.title;
          return e;
        }).toList();
        return temp;
      });
}
