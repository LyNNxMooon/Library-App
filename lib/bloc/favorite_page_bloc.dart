import 'package:flutter/material.dart';
import 'package:library_app/data/model/library_app_hive_model.dart';
import 'package:library_app/data/vos/favorite_page_vos/favorite_book_list.dart';

import 'package:library_app/data/vos/home_screen_vos/books_vo.dart';

class FavoritePageBloc extends ChangeNotifier {
  bool isDispose = false;
  final LibraryAppHiveModel _libraryAppHiveModel = LibraryAppHiveModel();

  void addToFavorite(String listName, BooksVO book) {
    FavoriteBookList newFavoriteList = FavoriteBookList(listName, [book]);
    List favoriteList = _libraryAppHiveModel.getFavoriteBooksList;

    int existingIndex = -1;
    bool alreadyExists = false;

    for (FavoriteBookList favoriteBooks in favoriteList) {
      if (listName == favoriteBooks.listName) {
        existingIndex = favoriteList.indexOf(favoriteBooks);
      }
      if (favoriteBooks.favoriteBooksList!.contains(book)) {
        alreadyExists = true;
      }
    }

    if (existingIndex != -1) {
      if (alreadyExists == false) {
        favoriteList.elementAt(existingIndex).favoriteBooksList.add(book);
      }
    } else {
      favoriteList.add(newFavoriteList);
    }

    _libraryAppHiveModel.saveFavoriteBooksList(favoriteList);
    notifyListeners();
  }

  //remove method

  void removeFromFavorite(BooksVO book) {
    List favoriteList = _libraryAppHiveModel.getFavoriteBooksList;

    int indexOfEmptyBookList = -1;
    int indexOfRemovalList = -1;

    for (FavoriteBookList favoriteBooks in favoriteList) {
      if (favoriteBooks.favoriteBooksList!.contains(book)) {
        indexOfRemovalList = favoriteList.indexOf(favoriteBooks);
        if (favoriteBooks.favoriteBooksList!.length == 1) {
          indexOfEmptyBookList = favoriteList.indexOf(favoriteBooks);
        }
      }
    }

    if (indexOfEmptyBookList != -1) {
      favoriteList.removeAt(indexOfEmptyBookList);
    } else {
      favoriteList[indexOfRemovalList].favoriteBooksList.remove(book);
    }
    _libraryAppHiveModel.saveFavoriteBooksList(favoriteList);
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
