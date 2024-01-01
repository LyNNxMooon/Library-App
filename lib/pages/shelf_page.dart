import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:library_app/bloc/shelf_page_bloc.dart';

import 'package:library_app/constant/colors.dart';
import 'package:library_app/constant/dimensions.dart';
import 'package:library_app/constant/images.dart';

import 'package:library_app/constant/strings.dart';
import 'package:library_app/data/model/library_app_hive_model.dart';

import 'package:library_app/pages/home_page.dart';
import 'package:library_app/pages/shelf_detail_page.dart';

import 'package:library_app/widgets/create_shelf_dialog_widget.dart';
import 'package:library_app/widgets/shelf_tile_widget.dart';
import 'package:provider/provider.dart';

class ShelfPage extends StatefulWidget {
  const ShelfPage({super.key});

  @override
  State<ShelfPage> createState() => _ShelfPageState();
}

class _ShelfPageState extends State<ShelfPage> {
  List shelfList = [];

  final LibraryAppHiveModel _libraryAppHiveModel = LibraryAppHiveModel();
  final TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    shelfList = _libraryAppHiveModel.getShelf;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShelfPageBloc>(
      create: (context) => ShelfPageBloc(),
      child: Container(
        color: kPrimaryColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              ShelfListSessionView(shelfList: shelfList),
              const Gap(kSP20x),
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => CreateNewShelfDialog(
                        shelfList: shelfList,
                        titleController: _titleController,
                      ),
                    );
                  },
                  child: Container(
                    width: kCreateShelfButtonWidth,
                    height: kCreateShelfButtonHeight,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(kSP40x)),
                        color: kSecondaryColor),
                    child: const Center(
                      child: Text(
                        kCreateNewShelfText,
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//
//Shelf List Session View
//

class ShelfListSessionView extends StatelessWidget {
  const ShelfListSessionView({super.key, required this.shelfList});
  final List shelfList;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List?>(
      stream: libraryAppHiveModel.getShelfStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.61,
          child: ListView.separated(
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                final bloc = context.read<ShelfPageBloc>();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShelfDetailPage(
                          deleteShelf: () =>
                              bloc.deleteShelf(shelfList, shelfList[index]),
                          title: shelfList[index].shelfName,
                          books: shelfList[index].books,
                          index: index),
                    ));
              },
              child: ShelfTileView(
                  coverImage: shelfList[index].books.isEmpty
                      ? kSelfCoverImage
                      : shelfList[index].books.last.bookImage,
                  title: shelfList[index].shelfName,
                  bookCount: shelfList[index].books.length),
            ),
            itemCount: shelfList.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: kSP20x,
            ),
          ),
        );
      },
    );
  }
}
