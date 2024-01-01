import 'package:library_app/network/api_constant/api_constant.dart';
import 'package:library_app/network/response/home_screen_response/home_screen_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
part 'home_screen_api.g.dart';

@RestApi(baseUrl: kHomeScreenBaseURL)
abstract class HomeScreenApi {
  factory HomeScreenApi(Dio dio) => _HomeScreenApi(dio);

  @GET(kEndPointForHomeScreen)
  Future<HomeScreenResponse> getHomeScreenResponse(
    @Query(kQueryParamsKeyForPublishedDate) String publishedDate,
    @Query(kQueryParamsApiKey) String apiKey,
  );
}
