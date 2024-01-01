import 'package:json_annotation/json_annotation.dart';
part 'search_info_vo.g.dart';

@JsonSerializable()
class SearchInfoVO {
  final String? textSnippet;

  SearchInfoVO({required this.textSnippet});

  factory SearchInfoVO.fromJson(Map<String, dynamic> json) =>
      _$SearchInfoVOFromJson(json);
}
