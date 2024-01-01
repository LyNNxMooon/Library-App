// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeScreenResponse _$HomeScreenResponseFromJson(Map<String, dynamic> json) =>
    HomeScreenResponse(
      status: json['status'] as String,
      copyright: json['copyright'] as String,
      numResults: json['num_results'] as int,
      results: BookListsResultsResponse.fromJson(
          json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeScreenResponseToJson(HomeScreenResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'copyright': instance.copyright,
      'num_results': instance.numResults,
      'results': instance.results,
    };
