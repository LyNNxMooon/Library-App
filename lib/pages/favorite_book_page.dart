// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:library_app/constant/colors.dart';
import 'package:library_app/constant/dimensions.dart';
import 'package:library_app/constant/strings.dart';
import 'package:library_app/data/model/library_app_hive_model.dart';

import 'package:library_app/pages/book_detail_page.dart';
import 'package:library_app/widgets/book_item_widget.dart';

LibraryAppHiveModel libraryAppHiveModel = LibraryAppHiveModel();

class FavoriteBookPage extends StatefulWidget {
  const FavoriteBookPage({super.key});

  @override
  State<FavoriteBookPage> createState() => _FavoriteBookPageState();
}

class _FavoriteBookPageState extends State<FavoriteBookPage> {
  List favoriteList = [];

  @override
  void initState() {
    favoriteList = libraryAppHiveModel.getFavoriteBooksList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: kPrimaryColor,
        child: StreamBuilder<List?>(
            stream: libraryAppHiveModel.getFavoriteBooksListStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return favoriteList.isEmpty
                  ? const Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.emoji_emotions,
                            color: kSecondaryColor,
                            size: kSP70x,
                          ),
                          Gap(kSP20x),
                          Text(kFavoritePageNoBookText)
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: kSP10x, top: kSP20x),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: ListView.separated(
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    favoriteList[index].listName,
                                    style: const TextStyle(
                                        fontSize: kFontSize18x,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Gap(kSP5x),
                                  FavoriteBooksSliderSessionView(
                                      title: favoriteList[index].listName,
                                      favoriteBooks:
                                          favoriteList[index].favoriteBooksList)
                                ],
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: kSP15x,
                                ),
                            itemCount: favoriteList.length),
                      ));
            }));
  }
}

//
//favorite books slider session view
//

class FavoriteBooksSliderSessionView extends StatefulWidget {
  const FavoriteBooksSliderSessionView({
    super.key,
    required this.favoriteBooks,
    required this.title,
  });
  final List favoriteBooks;

  final String title;

  @override
  State<FavoriteBooksSliderSessionView> createState() =>
      _FavoriteBooksSliderSessionViewState();
}

class _FavoriteBooksSliderSessionViewState
    extends State<FavoriteBooksSliderSessionView> {
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
              bool isFavorite = true;
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookDetailPage(
                                author: widget.favoriteBooks[index].author,
                                coverImage:
                                    widget.favoriteBooks[index].bookImage,
                                description:
                                    widget.favoriteBooks[index].description,
                                price: widget.favoriteBooks[index].price,
                                rank: widget.favoriteBooks[index].rank,
                                title: widget.favoriteBooks[index].title,
                                year: widget.favoriteBooks[index].createdDate,
                              )));
                },
                child: BookItemView(
                    book: widget.favoriteBooks[index],
                    bookListTitle: widget.title,
                    isAdded: isFavorite,
                    bookImage: widget.favoriteBooks[index].bookImage,
                    bookName: widget.favoriteBooks[index].title),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  width: kSP20x,
                ),
            itemCount: widget.favoriteBooks.length),
      ),
    );
  }
}
