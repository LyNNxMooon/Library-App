import 'package:hive_flutter/adapters.dart';
import 'package:library_app/data/vos/home_screen_vos/books_vo.dart';
import 'package:library_app/persistent/hive_constant.dart';
part 'shelf_list_vo.g.dart';

@HiveType(typeId: kHiveShelfListVOTypeId)
class ShelfListVO {
  @HiveField(0)
  String shelfName;
  @HiveField(1)
  String cover;

  @HiveField(2)
  List<BooksVO>? books;

  ShelfListVO(this.shelfName, this.cover, this.books);

  factory ShelfListVO.fromJson(Map<String, dynamic> json) => ShelfListVO(
      json['shelfName'] as String,
      json['cover'] as String,
      json['books'] as List<BooksVO>?);

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'shelfName': shelfName, 'cover': cover, 'books': books};
}
