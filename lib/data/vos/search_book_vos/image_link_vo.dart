import 'package:json_annotation/json_annotation.dart';
part 'image_link_vo.g.dart';

@JsonSerializable()
class ImageLinksVO {
  String? smallThumbnail;
  final String? thumbnail;

  ImageLinksVO({required this.smallThumbnail, required this.thumbnail});

  factory ImageLinksVO.fromJson(Map<String, dynamic> json) =>
      _$ImageLinksVOFromJson(json);
}
