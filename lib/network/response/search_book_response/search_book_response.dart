import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/data/vos/search_book_vos/search_book_items_vo.dart';
part 'search_book_response.g.dart';

@JsonSerializable()
class SearchBookResponse {
  final String? kind;
  final int? totalItems;
  final List<SearchBookItemsVO> items;

  SearchBookResponse(
      {required this.kind, required this.totalItems, required this.items});

  factory SearchBookResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchBookResponseFromJson(json);
}
