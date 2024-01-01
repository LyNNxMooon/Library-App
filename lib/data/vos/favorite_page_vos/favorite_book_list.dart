import 'package:hive_flutter/adapters.dart';
import 'package:library_app/data/vos/home_screen_vos/books_vo.dart';
import 'package:library_app/persistent/hive_constant.dart';
part 'favorite_book_list.g.dart';

@HiveType(typeId: kHiveFavoriteBookListVOTypeId)
class FavoriteBookList {
  @HiveField(0)
  String listName;
  @HiveField(1)
  List<BooksVO>? favoriteBooksList;

  FavoriteBookList(this.listName, this.favoriteBooksList);

  factory FavoriteBookList.fromJson(Map<String, dynamic> json) =>
      FavoriteBookList(json['listName'] as String,
          json['favoriteBooksList'] as List<BooksVO>?);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'listName': listName,
        'favoriteBooksList': favoriteBooksList
      };
}
