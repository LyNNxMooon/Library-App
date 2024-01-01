import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/data/vos/search_book_vos/image_link_vo.dart';
import 'package:library_app/data/vos/search_book_vos/industry_identifiers_vo.dart';
import 'package:library_app/data/vos/search_book_vos/panelization_summary_vo.dart';
import 'package:library_app/data/vos/search_book_vos/reading_mode_vo.dart';
part 'volume_info_vo.g.dart';

@JsonSerializable()
class VolumeInfoVO {
  String? title;
  final String? publishedDate;
  final String? subtitle;
  final List<String>? authors;
  final String? description;
  final List<IndustryIdentifiersVO>? industryIdentifiers;
  final ReadingModeVO? readingModes;
  final int? pageCount;
  final String? printType;
  final List<String>? categories;
  final String? maturityRating;
  final bool allowAnonLogging;
  final String? contentVersion;
  final PanelizationSummaryVO? panelizationSummary;
  final ImageLinksVO? imageLinks;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;

  VolumeInfoVO(this.subtitle, this.authors, this.description,
      {required this.title,
      required this.publishedDate,
      required this.industryIdentifiers,
      required this.readingModes,
      required this.pageCount,
      required this.printType,
      required this.categories,
      required this.maturityRating,
      required this.allowAnonLogging,
      required this.contentVersion,
      required this.panelizationSummary,
      required this.imageLinks,
      required this.language,
      required this.previewLink,
      required this.infoLink,
      required this.canonicalVolumeLink});

  factory VolumeInfoVO.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoVOFromJson(json);
}
