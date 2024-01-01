import 'package:dio/dio.dart';
import 'package:library_app/data/model/library_app_hive_model.dart';
import 'package:library_app/data/vos/home_screen_vos/book_lists_vo.dart';
import 'package:library_app/data/vos/search_book_vos/search_book_items_vo.dart';
import 'package:library_app/network/api/home_screen_api.dart';
import 'package:library_app/network/api/search_book_api.dart';
import 'package:library_app/network/api_constant/api_constant.dart';
import 'package:library_app/network/data_agent/library_app_data_agent.dart';

class LibraryAppDataAgentImpl extends LibraryAppDataAgent {
  late HomeScreenApi _homeScreenApi;
  late SearchBookApi _searchBookApi;
  LibraryAppDataAgentImpl._() {
    _homeScreenApi = HomeScreenApi(Dio());
    _searchBookApi = SearchBookApi(Dio());
  }

  static final LibraryAppDataAgentImpl _singleton = LibraryAppDataAgentImpl._();
  factory LibraryAppDataAgentImpl() => _singleton;

  final LibraryAppHiveModel _libraryAppHiveModel = LibraryAppHiveModel();
  @override
  Future<List<BookListsVO>> getBookLists() => _homeScreenApi
      .getHomeScreenResponse(kPublishedDateValue, kAPIValue)
      .asStream()
      .map((event) => event.results.lists)
      .first;

  @override
  Future<List<SearchBookItemsVO>> getSearchBooks() => _searchBookApi
      .getSearchBooks(_libraryAppHiveModel.getSearchBookQuery)
      .asStream()
      .map((event) => event.items)
      .first;
}
