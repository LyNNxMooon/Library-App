import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:library_app/constant/colors.dart';
import 'package:library_app/constant/dimensions.dart';
import 'package:library_app/data/model/library_app_hive_model.dart';
import 'package:library_app/pages/favorite_book_page.dart';
import 'package:library_app/pages/shelf_page.dart';

import 'package:library_app/widgets/search_bar_widget.dart';

final LibraryAppHiveModel libraryAppHiveModel = LibraryAppHiveModel();

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(kSP25x),
              const SearchBarWidget(),
              const Gap(kSP20x),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: kSP20x),
                child: TabBar(tabs: [
                  Tab(
                    child: Text(
                      'Your Books',
                      style: TextStyle(
                          color: kSecondaryColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Your Shelves',
                      style: TextStyle(
                          color: kSecondaryColor, fontWeight: FontWeight.bold),
                    ),
                  )
                ]),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.width * 1.5,
                  child: const TabBarView(
                      children: [FavoriteBookPage(), ShelfPage()]))
            ],
          ),
        ),
      )),
    );
  }
}
