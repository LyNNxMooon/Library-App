import 'package:flutter/material.dart';
import 'package:library_app/data/model/library_app_hive_model.dart';
import 'package:library_app/data/model/library_app_model.dart';
import 'package:library_app/data/vos/home_screen_vos/book_lists_vo.dart';
import 'package:library_app/data/vos/home_screen_vos/books_vo.dart';

class HomePageBloc extends ChangeNotifier {
  bool isDispose = false;
  final LibraryAppModel _libraryAppModel = LibraryAppModel();
  final LibraryAppHiveModel _libraryAppHiveModel = LibraryAppHiveModel();

  List<BookListsVO> bookLists = [];

  HomePageBloc() {
    _libraryAppModel.getAllBookLists().then((value) {
      bookLists = value;
      notifyListeners();
    });
  }

  void saveRecentBookList(BooksVO recentBook) {
    List recentBooksList = _libraryAppHiveModel.getRecentlyViewedBookList;
    int existingIndex = -1;
    for (BooksVO book in recentBooksList) {
      if (recentBook.title == book.title) {
        existingIndex = recentBooksList.indexOf(book);
      }
    }

    if (existingIndex != -1) {
      recentBooksList.removeAt(existingIndex);
    }

    recentBooksList.insert(0, recentBook);

    _libraryAppHiveModel.saveRecentlyViewedList(recentBooksList);

    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (!isDispose) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    isDispose = true;
    super.dispose();
  }
}
