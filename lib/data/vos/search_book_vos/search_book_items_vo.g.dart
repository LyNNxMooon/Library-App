// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_book_items_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchBookItemsVO _$SearchBookItemsVOFromJson(Map<String, dynamic> json) =>
    SearchBookItemsVO(
      kind: json['kind'] as String?,
      id: json['id'] as String?,
      etag: json['etag'] as String?,
      selfLink: json['selfLink'] as String?,
      volumeInfo: json['volumeInfo'] == null
          ? null
          : VolumeInfoVO.fromJson(json['volumeInfo'] as Map<String, dynamic>),
      saleInfo: json['saleInfo'] == null
          ? null
          : SaleInfoVO.fromJson(json['saleInfo'] as Map<String, dynamic>),
      accessInfo: json['accessInfo'] == null
          ? null
          : AccessInfoVO.fromJson(json['accessInfo'] as Map<String, dynamic>),
      searchInfo: json['searchInfo'] == null
          ? null
          : SearchInfoVO.fromJson(json['searchInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchBookItemsVOToJson(SearchBookItemsVO instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'id': instance.id,
      'etag': instance.etag,
      'selfLink': instance.selfLink,
      'volumeInfo': instance.volumeInfo,
      'saleInfo': instance.saleInfo,
      'accessInfo': instance.accessInfo,
      'searchInfo': instance.searchInfo,
    };
