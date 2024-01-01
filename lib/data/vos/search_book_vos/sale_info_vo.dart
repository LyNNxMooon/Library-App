import 'package:json_annotation/json_annotation.dart';
part 'sale_info_vo.g.dart';

@JsonSerializable()
class SaleInfoVO {
  final String? country;
  final String? saleability;
  final bool isEbook;

  SaleInfoVO(
      {required this.country,
      required this.saleability,
      required this.isEbook});

  factory SaleInfoVO.fromJson(Map<String, dynamic> json) =>
      _$SaleInfoVOFromJson(json);
}
