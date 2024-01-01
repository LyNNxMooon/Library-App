import 'package:json_annotation/json_annotation.dart';
part 'industry_identifiers_vo.g.dart';

@JsonSerializable()
class IndustryIdentifiersVO {
  final String? type;
  final String? identifier;

  IndustryIdentifiersVO({required this.type, required this.identifier});

  factory IndustryIdentifiersVO.fromJson(Map<String, dynamic> json) =>
      _$IndustryIdentifiersVOFromJson(json);
}
