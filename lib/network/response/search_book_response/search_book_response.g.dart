// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_book_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchBookResponse _$SearchBookResponseFromJson(Map<String, dynamic> json) =>
    SearchBookResponse(
      kind: json['kind'] as String?,
      totalItems: json['totalItems'] as int?,
      items: (json['items'] as List<dynamic>)
          .map((e) => SearchBookItemsVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchBookResponseToJson(SearchBookResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'totalItems': instance.totalItems,
      'items': instance.items,
    };
