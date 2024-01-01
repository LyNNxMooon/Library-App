import 'package:json_annotation/json_annotation.dart';

import 'package:library_app/data/vos/home_screen_vos/books_vo.dart';

part 'book_lists_vo.g.dart';

@JsonSerializable()
class BookListsVO {
  @JsonKey(name: "list_id")
  final int listID;

  @JsonKey(name: "list_name")
  final String listName;

  @JsonKey(name: "list_name_encoded")
  final String listNameEncoded;

  @JsonKey(name: "display_name")
  final String displayName;

  final String updated;

  @JsonKey(name: "list_image")
  final String? listImage;

  @JsonKey(name: "list_image_width")
  final int? listImageWidth;

  @JsonKey(name: "list_image_height")
  final int? listImageHeight;

  final List<BooksVO>? books;

  BookListsVO(
      {required this.listID,
      required this.listName,
      required this.listNameEncoded,
      required this.displayName,
      required this.updated,
      required this.listImage,
      required this.listImageWidth,
      required this.listImageHeight,
      required this.books});

  factory BookListsVO.fromJson(Map<String, dynamic> json) =>
      _$BookListsVOFromJson(json);
}
