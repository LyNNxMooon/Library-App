import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/network/response/home_screen_response/book_lists_results_response.dart';
part 'home_screen_response.g.dart';

@JsonSerializable()
class HomeScreenResponse {
  final String status;
  final String copyright;
  @JsonKey(name: "num_results")
  final int numResults;
  final BookListsResultsResponse results;

  HomeScreenResponse(
      {required this.status,
      required this.copyright,
      required this.numResults,
      required this.results});

  factory HomeScreenResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeScreenResponseFromJson(json);
}
