import 'package:flutter/material.dart';
import 'package:library_app/constant/colors.dart';
import 'package:library_app/constant/images.dart';
import 'package:library_app/data/model/library_app_hive_model.dart';
import 'package:library_app/data/vos/home_screen_vos/books_vo.dart';
import 'package:library_app/data/vos/shelf_page_vos/shelf_list_vo.dart';

class ShelfPageBloc extends ChangeNotifier {
  bool isDispose = false;

  final LibraryAppHiveModel _libraryAppHiveModel = LibraryAppHiveModel();

  void addNewShelf(
      BuildContext context, TextEditingController controller, List shelfList) {
    ShelfListVO shelf = ShelfListVO(controller.text, kSelfCoverImage, []);
    shelfList.add(shelf);
    _libraryAppHiveModel.saveShelf(shelfList);

    controller.clear();
    Navigator.pop(context);
    notifyListeners();
  }

  void saveBookToShelf(List shelfList, int index, BuildContext context) {
    shelfList[index].books.add(_libraryAppHiveModel.getSavingBook);

    shelfList[index].cover = _libraryAppHiveModel.getSavingBook?.bookImage;
    _libraryAppHiveModel.saveShelf(shelfList);

    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: kSecondaryColor,
        content: Text(
            "${_libraryAppHiveModel.getSavingBook?.title} is added to ${shelfList[index].shelfName}")));
    notifyListeners();
  }

  void deleteShelf(List shelfList, ShelfListVO shelf) {
    shelfList.remove(shelf);
    _libraryAppHiveModel.saveShelf(shelfList);
    notifyListeners();
  }

  void removeBookFromShelf(List shelfList, int index, BooksVO book) {
    shelfList[index].books.remove(book);
    _libraryAppHiveModel.saveShelf(shelfList);
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
