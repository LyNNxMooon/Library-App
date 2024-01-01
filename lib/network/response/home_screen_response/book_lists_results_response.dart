import 'package:json_annotation/json_annotation.dart';

import 'package:library_app/data/vos/home_screen_vos/book_lists_vo.dart';
part 'book_lists_results_response.g.dart';

@JsonSerializable()
class BookListsResultsResponse {
  @JsonKey(name: "bestsellers_date")
  final String bestsellersDate;
  @JsonKey(name: "published_date")
  final String publishedDate;
  @JsonKey(name: "published_date_description")
  final String publishedDateDescription;
  @JsonKey(name: "previous_published_date")
  final String previousPublishedDate;
  @JsonKey(name: "next_published_date")
  final String nextPublishedDate;
  final List<BookListsVO> lists;

  BookListsResultsResponse(
      {required this.bestsellersDate,
      required this.publishedDate,
      required this.publishedDateDescription,
      required this.previousPublishedDate,
      required this.nextPublishedDate,
      required this.lists});

  factory BookListsResultsResponse.fromJson(Map<String, dynamic> json) =>
      _$BookListsResultsResponseFromJson(json);
}
