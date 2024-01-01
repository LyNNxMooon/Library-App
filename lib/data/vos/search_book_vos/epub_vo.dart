import 'package:json_annotation/json_annotation.dart';
part 'epub_vo.g.dart';

@JsonSerializable()
class Epub {
  final bool isAvailable;

  Epub({required this.isAvailable});

  factory Epub.fromJson(Map<String, dynamic> json) => _$EpubFromJson(json);
}
