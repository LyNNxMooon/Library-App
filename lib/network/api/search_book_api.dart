import 'package:dio/dio.dart';
import 'package:library_app/network/api_constant/api_constant.dart';
import 'package:library_app/network/response/search_book_response/search_book_response.dart';
import 'package:retrofit/http.dart';
part 'search_book_api.g.dart';

@RestApi(baseUrl: kSearchBookBaseURL)
abstract class SearchBookApi {
  factory SearchBookApi(Dio dio) => _SearchBookApi(dio);

  @GET(kEndPointForSearchBook)
  Future<SearchBookResponse> getSearchBooks(
      @Query(kQueryParamsKeyForSearchBook) String q);
}
