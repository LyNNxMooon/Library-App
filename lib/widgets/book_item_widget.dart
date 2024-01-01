// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:library_app/bloc/favorite_page_bloc.dart';
import 'package:library_app/constant/colors.dart';
import 'package:library_app/constant/dimensions.dart';
import 'package:library_app/data/model/library_app_hive_model.dart';
import 'package:library_app/data/vos/home_screen_vos/books_vo.dart';

import 'package:provider/provider.dart';

LibraryAppHiveModel libraryAppHiveModel = LibraryAppHiveModel();

class BookItemView extends StatelessWidget {
  BookItemView({
    super.key,
    required this.bookImage,
    required this.bookName,
    required this.isAdded,
    required this.book,
    required this.bookListTitle,
  });

  final String bookImage;
  final String bookName;

  bool isAdded;

  final BooksVO book;
  final String bookListTitle;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FavoritePageBloc>(
      create: (context) => FavoritePageBloc(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(children: [
            Container(
              width: kBookItemWidth,
              height: kBookItemHeight,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(kSP15x))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kSP15x),
                child: Image.network(
                  bookImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                left: kSP115x,
                child: AddToFavoriteIconWidget(
                  isTapped: isAdded,
                  book: book,
                  bookListTitle: bookListTitle,
                ))
          ]),
          const Gap(kSP10x),
          SizedBox(
            width: kBookItemWidth,
            child: Text(
              bookName,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

//
//Add to Favorite Icon View
//

class AddToFavoriteIconWidget extends StatefulWidget {
  AddToFavoriteIconWidget({
    super.key,
    required this.isTapped,
    required this.book,
    required this.bookListTitle,
  });

  bool isTapped;
  final BooksVO book;
  final String bookListTitle;

  @override
  State<AddToFavoriteIconWidget> createState() =>
      _AddToFavoriteIconWidgetState();
}

class _AddToFavoriteIconWidgetState extends State<AddToFavoriteIconWidget> {
  void addToFavorite() {
    setState(() {
      widget.isTapped = !widget.isTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSP5x),
      child: GestureDetector(
        onTap: () {
          addToFavorite();

          final bloc = context.read<FavoritePageBloc>();
          if (widget.isTapped == true) {
            bloc.addToFavorite(widget.bookListTitle, widget.book);
          } else if (widget.isTapped == false) {
            bloc.removeFromFavorite(widget.book);
          }
        },
        child: Icon(
          widget.isTapped ? Icons.favorite : Icons.favorite_border_outlined,
          color: kAddToFavoriteColor,
          size: kSP25x,
        ),
      ),
    );
  }
}
