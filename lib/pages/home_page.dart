// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:library_app/bloc/home_page_bloc.dart';
import 'package:library_app/constant/colors.dart';
import 'package:library_app/constant/dimensions.dart';
import 'package:library_app/constant/strings.dart';

import 'package:library_app/data/model/library_app_hive_model.dart';
import 'package:library_app/data/vos/home_screen_vos/book_lists_vo.dart';
import 'package:library_app/data/vos/home_screen_vos/books_vo.dart';
import 'package:library_app/pages/add_to_shelf_page.dart';

import 'package:library_app/pages/book_detail_page.dart';
import 'package:library_app/widgets/book_item_widget.dart';

import 'package:library_app/widgets/search_bar_widget.dart';
import 'package:provider/provider.dart';

final LibraryAppHiveModel libraryAppHiveModel = LibraryAppHiveModel();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageBloc>(
      create: (context) => HomePageBloc(),
      child: const SafeArea(
          child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(kSP25x),
              SearchBarWidget(),
              Gap(kSP25x),
              RecentlyViewedBooksSliderSessionView(),
              VerticalBookListsSessionView()
            ],
          ),
        ),
      )),
    );
  }
}

//
//Recently Viewed Books Slier Session
//

class RecentlyViewedBooksSliderSessionView extends StatefulWidget {
  const RecentlyViewedBooksSliderSessionView({super.key});

  @override
  State<RecentlyViewedBooksSliderSessionView> createState() =>
      _RecentlyViewedBooksSliderSessionViewState();
}

class _RecentlyViewedBooksSliderSessionViewState
    extends State<RecentlyViewedBooksSliderSessionView> {
  List recentBooks = [];

  @override
  void initState() {
    recentBooks = libraryAppHiveModel.getRecentlyViewedBookList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List?>(
      stream: libraryAppHiveModel.getRecentBookListStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return recentBooks.isEmpty
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(bottom: kSP30x),
                child: CarouselSlider.builder(
                    itemCount: recentBooks.length,
                    itemBuilder: (context, index, realIndex) => GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookDetailPage(
                                  title: recentBooks[index].title,
                                  author: recentBooks[index].author,
                                  coverImage: recentBooks[index].bookImage,
                                  description: recentBooks[index].description,
                                  price: recentBooks[index].price,
                                  rank: recentBooks[index].rank,
                                  year: recentBooks[index].createdDate,
                                ),
                              )),
                          onLongPress: () {
                            showModalBottomSheet(
                              isDismissible: true,
                              context: context,
                              builder: (context) => BottomSheetSessionView(
                                  book: recentBooks[index]),
                            );
                          },
                          child: RecentlyViewedBookSliderItemView(
                              index: index, recentBooks: recentBooks),
                        ),
                    options: CarouselOptions(
                      aspectRatio: 2 / 1.3,
                      viewportFraction: 0.6,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.2,
                      scrollDirection: Axis.horizontal,
                    )),
              );
      },
    );
  }
}

class RecentlyViewedBookSliderItemView extends StatelessWidget {
  const RecentlyViewedBookSliderItemView({
    super.key,
    required this.recentBooks,
    required this.index,
  });

  final List recentBooks;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: kBookSliderItemWidth,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(kSP25x)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(kSP15x),
          child: Image.network(
            recentBooks[index].bookImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        left: kSP170x,
        child: GestureDetector(
          onTap: () {
            recentBooks.remove(recentBooks[index]);
            libraryAppHiveModel.saveRecentlyViewedList(recentBooks);
          },
          child: const Icon(
            Icons.delete_forever,
            color: kDeleteColor,
            size: kSP27x,
          ),
        ),
      ),
    ]);
  }
}

//
//Book List Column Session
//

class VerticalBookListsSessionView extends StatelessWidget {
  const VerticalBookListsSessionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, List<BookListsVO>>(
      builder: (_, bookLists, __) {
        if (bookLists.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(color: kSecondaryColor),
          );
        }
        return Padding(
            padding: const EdgeInsets.only(left: kSP10x),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.9,
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bookLists[index].displayName,
                            style: const TextStyle(
                                fontSize: kFontSize18x,
                                fontWeight: FontWeight.bold),
                          ),
                          const Gap(kSP5x),
                          BooksSliderSessionView(
                            bookListTitle: bookLists[index].displayName,
                            booksList: bookLists[index],
                          )
                        ],
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: kSP25x,
                      ),
                  itemCount: bookLists.length),
            ));
      },
      selector: (_, bloc) => bloc.bookLists,
    );
  }
}

//
//Books Slider Session
//

class BooksSliderSessionView extends StatelessWidget {
  const BooksSliderSessionView({
    super.key,
    required this.booksList,
    required this.bookListTitle,
  });

  final BookListsVO booksList;

  final String bookListTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kSP15x),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 1,
        height: kBooksSliderSessionHeight,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              bool isAdded = false;
              return GestureDetector(
                onTap: () {
                  final homePageBloc = context.read<HomePageBloc>();
                  homePageBloc.saveRecentBookList(booksList.books![index]);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetailPage(
                          title: booksList.books![index].title,
                          author: booksList.books![index].author,
                          coverImage: booksList.books![index].bookImage,
                          description: booksList.books![index].description,
                          price: booksList.books![index].price,
                          rank: booksList.books![index].rank,
                          year: booksList.books![index].createdDate,
                        ),
                      ));
                },
                onLongPress: () {
                  showModalBottomSheet(
                    isDismissible: true,
                    context: context,
                    builder: (context) =>
                        BottomSheetSessionView(book: booksList.books![index]),
                  );
                },
                child: BookItemView(
                    book: booksList.books![index],
                    bookListTitle: bookListTitle,
                    isAdded: isAdded,
                    bookImage: booksList.books![index].bookImage,
                    bookName: booksList.books![index].title),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  width: kSP20x,
                ),
            itemCount: booksList.books?.length ?? 0),
      ),
    );
  }
}

//
//Bottom Sheet View
//

class BottomSheetSessionView extends StatelessWidget {
  const BottomSheetSessionView({
    super.key,
    required this.book,
  });

  final BooksVO book;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: kSP10x, left: kSP20x),
      height: kBottomSheetHeight,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: kBottomSheetBookImageWidth,
                height: kBottomSheetBookImageHeight,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(kSP5x))),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(kSP5x)),
                  child: Image.network(
                    book.bookImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Gap(kSP25x),
              SizedBox(
                width: kBottomSheetBookNameWidth,
                child: Text(
                  book.title,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          const Divider(
            color: kBlackColor,
            thickness: 2,
            endIndent: kSP10x,
            height: kSP40x,
          ),
          GestureDetector(
            onTap: () {
              libraryAppHiveModel.saveSavingBook(book);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddToShelfPage(),
                  ));
            },
            child: const Row(
              children: [
                Gap(kSP5x),
                Icon(Icons.add),
                Gap(kSP50x),
                Text(kBottomSheetAddToShelfText)
              ],
            ),
          )
        ],
      ),
    );
  }
}
