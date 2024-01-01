import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/data/vos/search_book_vos/access_info_vo.dart';
import 'package:library_app/data/vos/search_book_vos/sale_info_vo.dart';
import 'package:library_app/data/vos/search_book_vos/search_info_vo.dart';
import 'package:library_app/data/vos/search_book_vos/volume_info_vo.dart';
part 'search_book_items_vo.g.dart';

@JsonSerializable()
class SearchBookItemsVO {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final VolumeInfoVO? volumeInfo;
  final SaleInfoVO? saleInfo;
  final AccessInfoVO? accessInfo;
  final SearchInfoVO? searchInfo;

  SearchBookItemsVO(
      {required this.kind,
      required this.id,
      required this.etag,
      required this.selfLink,
      required this.volumeInfo,
      required this.saleInfo,
      required this.accessInfo,
      required this.searchInfo});

  factory SearchBookItemsVO.fromJson(Map<String, dynamic> json) =>
      _$SearchBookItemsVOFromJson(json);
}
