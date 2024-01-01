// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_lists_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookListsVO _$BookListsVOFromJson(Map<String, dynamic> json) => BookListsVO(
      listID: json['list_id'] as int,
      listName: json['list_name'] as String,
      listNameEncoded: json['list_name_encoded'] as String,
      displayName: json['display_name'] as String,
      updated: json['updated'] as String,
      listImage: json['list_image'] as String?,
      listImageWidth: json['list_image_width'] as int?,
      listImageHeight: json['list_image_height'] as int?,
      books: (json['books'] as List<dynamic>?)
          ?.map((e) => BooksVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookListsVOToJson(BookListsVO instance) =>
    <String, dynamic>{
      'list_id': instance.listID,
      'list_name': instance.listName,
      'list_name_encoded': instance.listNameEncoded,
      'display_name': instance.displayName,
      'updated': instance.updated,
      'list_image': instance.listImage,
      'list_image_width': instance.listImageWidth,
      'list_image_height': instance.listImageHeight,
      'books': instance.books,
    };
