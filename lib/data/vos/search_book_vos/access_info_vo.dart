import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/data/vos/search_book_vos/epub_vo.dart';
part 'access_info_vo.g.dart';

@JsonSerializable()
class AccessInfoVO {
  final String? country;
  final String? viewability;
  final bool embeddable;
  final bool publicDomain;
  final String? textToSpeechPermission;
  final Epub? epub;
  final Epub? pdf;
  final String? webReaderLink;
  final String? accessViewStatus;
  final bool quoteSharingAllowed;

  AccessInfoVO(
      {required this.country,
      required this.viewability,
      required this.embeddable,
      required this.publicDomain,
      required this.textToSpeechPermission,
      required this.epub,
      required this.pdf,
      required this.webReaderLink,
      required this.accessViewStatus,
      required this.quoteSharingAllowed});

  factory AccessInfoVO.fromJson(Map<String, dynamic> json) =>
      _$AccessInfoVOFromJson(json);
}
