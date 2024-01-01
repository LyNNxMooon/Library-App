import 'package:json_annotation/json_annotation.dart';
part 'reading_mode_vo.g.dart';

@JsonSerializable()
class ReadingModeVO {
  final bool text;
  final bool image;

  ReadingModeVO({required this.text, required this.image});

  factory ReadingModeVO.fromJson(Map<String, dynamic> json) =>
      _$ReadingModeVOFromJson(json);
}
