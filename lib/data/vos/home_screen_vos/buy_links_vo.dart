import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/persistent/hive_constant.dart';
part 'buy_links_vo.g.dart';

@HiveType(typeId: kHiveBuyLinkVOTypeId)
@JsonSerializable()
class BuyLinksVO {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String url;

  BuyLinksVO({required this.name, required this.url});

  factory BuyLinksVO.fromJson(Map<String, dynamic> json) =>
      _$BuyLinksVOFromJson(json);
}
