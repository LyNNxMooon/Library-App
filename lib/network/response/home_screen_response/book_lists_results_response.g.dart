// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_lists_results_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookListsResultsResponse _$BookListsResultsResponseFromJson(
        Map<String, dynamic> json) =>
    BookListsResultsResponse(
      bestsellersDate: json['bestsellers_date'] as String,
      publishedDate: json['published_date'] as String,
      publishedDateDescription: json['published_date_description'] as String,
      previousPublishedDate: json['previous_published_date'] as String,
      nextPublishedDate: json['next_published_date'] as String,
      lists: (json['lists'] as List<dynamic>)
          .map((e) => BookListsVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookListsResultsResponseToJson(
        BookListsResultsResponse instance) =>
    <String, dynamic>{
      'bestsellers_date': instance.bestsellersDate,
      'published_date': instance.publishedDate,
      'published_date_description': instance.publishedDateDescription,
      'previous_published_date': instance.previousPublishedDate,
      'next_published_date': instance.nextPublishedDate,
      'lists': instance.lists,
    };
