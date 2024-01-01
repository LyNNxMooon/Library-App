import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:library_app/bloc/search_book_page_bloc.dart';
import 'package:library_app/constant/colors.dart';
import 'package:library_app/constant/dimensions.dart';
import 'package:library_app/constant/images.dart';
import 'package:library_app/constant/strings.dart';
import 'package:library_app/data/model/library_app_hive_model.dart';
import 'package:library_app/data/vos/search_book_vos/search_book_items_vo.dart';
import 'package:library_app/pages/book_detail_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';

final LibraryAppHiveModel libraryAppHiveModel = LibraryAppHiveModel();
final Debouncer debouncer = Debouncer();
const duration = Duration(milliseconds: 250);
TextEditingController searchController = TextEditingController();

class SearchBookPage extends StatefulWidget {
  const SearchBookPage({super.key});

  @override
  State<SearchBookPage> createState() => _SearchBookPageState();
}

class _SearchBookPageState extends State<SearchBookPage> {
  @override
  void dispose() {
    searchController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchBookPageBloc>(
      create: (context) => SearchBookPageBloc(),
      child: const SafeArea(
          child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SearchBarSessionView(),
            Divider(
              thickness: 1,
              height: kSP20x,
            ),
            SearchBookListSessionView()
          ],
        ),
      )),
    );
  }
}

//
//Search Bar Session
//

class SearchBarSessionView extends StatefulWidget {
  const SearchBarSessionView({super.key});

  @override
  State<SearchBarSessionView> createState() => _SearchBarSessionViewState();
}

class _SearchBarSessionViewState extends State<SearchBarSessionView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      padding: const EdgeInsets.only(left: kSP20x, top: kSP10x, right: kSP20x),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back_ios_new),
              ),
              const Gap(kSP30x),
              SizedBox(
                width: kSearchBookTextFieldWidth,
                child: TextField(
                  controller: searchController,
                  onSubmitted: (value) {
                    List searchHistory = libraryAppHiveModel.getSearchHistory;

                    searchHistory.insert(0, value);
                    libraryAppHiveModel.saveSearchHistory(searchHistory);
                  },
                  decoration: const InputDecoration(
                      hintText: kSearchBarText,
                      enabledBorder:
                          UnderlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          UnderlineInputBorder(borderSide: BorderSide.none)),
                  onChanged: (value) {
                    debouncer.debounce(
                      duration: duration,
                      onDebounce: () {
                        libraryAppHiveModel.saveSearchBookQuery(value);
                        final bloc = context.read<SearchBookPageBloc>();
                        bloc.callSearchBooksApi();
                      },
                    );
                  },
                ),
              )
            ],
          ),
          const Icon(Icons.mic)
        ],
      ),
    );
  }
}

//
//Searched Books List View Session
//

class SearchBookListSessionView extends StatelessWidget {
  const SearchBookListSessionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<SearchBookPageBloc, List<SearchBookItemsVO>>(
      builder: (_, searchBookList, child) {
        if (searchBookList.isEmpty) {
          return const RecommendationListSessionView();
        }
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: kSP20x),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.8,
          child: ListView.separated(
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetailPage(
                            title:
                                searchBookList[index].volumeInfo?.title ?? '',
                            coverImage: searchBookList[index]
                                    .volumeInfo
                                    ?.imageLinks
                                    ?.thumbnail ??
                                kSelfCoverImage,
                            author: searchBookList[index]
                                    .volumeInfo
                                    ?.authors
                                    ?.elementAt(0) ??
                                'Anonymous',
                            price: "0.00",
                            description:
                                searchBookList[index].volumeInfo?.description ??
                                    "-",
                            rank: 0,
                            year: searchBookList[index]
                                    .volumeInfo
                                    ?.publishedDate ??
                                '-'),
                      )),
                  child: SearchBookTileView(
                    books: searchBookList[index],
                  )),
              separatorBuilder: (context, index) => const SizedBox(
                    height: kSP20x,
                  ),
              itemCount: searchBookList.length),
        );
      },
      selector: (_, bloc) => bloc.searchBooksList,
    );
  }
}

class SearchBookTileView extends StatelessWidget {
  const SearchBookTileView({super.key, required this.books});

  final SearchBookItemsVO books;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.height * 0.9,
      height: kSearchBookTileHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: kSearchBookTileImageWidth,
            height: kSearchBookTileImageHeight,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(kSP5x))),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kSP5x),
              child: Image.network(
                  books.volumeInfo?.imageLinks?.smallThumbnail ?? '',
                  fit: BoxFit.cover),
            ),
          ),
          const Gap(kSP20x),
          SizedBox(
            width: kSearchBookTitleWidth,
            child: Text(
              books.volumeInfo?.title ?? '',
            ),
          ),
        ],
      ),
    );
  }
}

//
//Search Page Recommendation list
//

class RecommendationListSessionView extends StatelessWidget {
  const RecommendationListSessionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kSP20x, vertical: kSP15x),
      child: const Column(
        children: [
          SearchHistorySessionView(),
          RecommendationListItemView(
              icon: Icons.sell, recommendation: kSearchPageTopSellingText),
          Gap(kSP25x),
          RecommendationListItemView(
              icon: Icons.warning, recommendation: kSearchPageNewReleaseText),
          Gap(kSP25x),
          RecommendationListItemView(
              icon: Icons.store, recommendation: kSearchPageBookShopText),
        ],
      ),
    );
  }
}

class RecommendationListItemView extends StatelessWidget {
  const RecommendationListItemView(
      {super.key, required this.icon, required this.recommendation});

  final IconData icon;
  final String recommendation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const Gap(kSP30x),
        Text(
          recommendation,
          style: const TextStyle(fontSize: kFontSize16x),
        )
      ],
    );
  }
}

//
//Search History Session View
//

class SearchHistorySessionView extends StatefulWidget {
  const SearchHistorySessionView({super.key});

  @override
  State<SearchHistorySessionView> createState() =>
      _SearchHistorySessionViewState();
}

class _SearchHistorySessionViewState extends State<SearchHistorySessionView> {
  List searchHistory = [];

  @override
  void initState() {
    searchHistory = libraryAppHiveModel.getSearchHistory;
    super.initState();
  }

  void removeHistory(String history) {
    setState(() {
      searchHistory.remove(history);
      libraryAppHiveModel.saveSearchHistory(searchHistory);
    });
  }

  void setSearchText(String searchText) {
    setState(() {
      searchController.text = searchText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return searchHistory.isEmpty
        ? const SizedBox()
        : SizedBox(
            width: MediaQuery.of(context).size.height * 0.9,
            height: double.parse("${47 * searchHistory.length}"),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => setSearchText(searchHistory[index]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.history),
                            const Gap(kSP30x),
                            Text(
                              searchHistory[index],
                              style: const TextStyle(fontSize: kFontSize16x),
                            )
                          ],
                        ),
                        GestureDetector(
                            onTap: () => removeHistory(searchHistory[index]),
                            child: const Icon(CupertinoIcons.multiply))
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: kSP20x,
                    ),
                itemCount: searchHistory.length));
  }
}
