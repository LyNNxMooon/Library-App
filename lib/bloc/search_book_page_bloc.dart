import 'package:flutter/material.dart';
import 'package:library_app/data/model/library_app_model.dart';
import 'package:library_app/data/vos/search_book_vos/search_book_items_vo.dart';

class SearchBookPageBloc extends ChangeNotifier {
  bool isDispose = false;
  final LibraryAppModel _libraryAppModel = LibraryAppModel();
  List<SearchBookItemsVO> searchBooksList = [];

  void callSearchBooksApi() {
    _libraryAppModel.getAllSearchBooks().then((value) {
      searchBooksList = value;
      notifyListeners();
    });
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
