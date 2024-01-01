import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:library_app/bloc/shelf_page_bloc.dart';
import 'package:library_app/constant/colors.dart';
import 'package:library_app/constant/dimensions.dart';
import 'package:library_app/constant/images.dart';

import 'package:library_app/constant/strings.dart';
import 'package:library_app/data/model/library_app_hive_model.dart';

import 'package:library_app/widgets/create_shelf_dialog_widget.dart';
import 'package:library_app/widgets/shelf_tile_widget.dart';
import 'package:provider/provider.dart';

final LibraryAppHiveModel _libraryAppHiveModel = LibraryAppHiveModel();

class AddToShelfPage extends StatefulWidget {
  const AddToShelfPage({super.key});

  @override
  State<AddToShelfPage> createState() => _AddToShelfPageState();
}

class _AddToShelfPageState extends State<AddToShelfPage> {
  List shelfList = [];

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
      child: SafeArea(
          child: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kPrimaryColor,
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios,
                color: kBlackColor,
              )),
          title: const Text(
            kAddToShelfTitleText,
            style: TextStyle(color: kBlackColor),
          ),
          centerTitle: true,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          color: kPrimaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              ShelfListSessionView(mainContext: context, shelfList: shelfList),
              const Gap(kSP20x),
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => CreateNewShelfDialog(
                      shelfList: shelfList,
                      titleController: _titleController,
                    ),
                  ),
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
      )),
    );
  }
}

class ShelfListSessionView extends StatelessWidget {
  const ShelfListSessionView(
      {super.key, required this.mainContext, required this.shelfList});

  final BuildContext mainContext;
  final List shelfList;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List?>(
      stream: _libraryAppHiveModel.getShelfStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.71,
          child: ListView.separated(
            itemBuilder: (_, index) => GestureDetector(
              onTap: () {
                final bloc = context.read<ShelfPageBloc>();
                bloc.saveBookToShelf(shelfList, index, mainContext);
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
