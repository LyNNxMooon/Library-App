import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:library_app/constant/colors.dart';
import 'package:library_app/constant/dimensions.dart';
import 'package:library_app/constant/strings.dart';
import 'package:library_app/data/model/library_app_hive_model.dart';
import 'package:library_app/data/vos/home_screen_vos/books_vo.dart';
import 'package:library_app/pages/book_detail_page.dart';

final LibraryAppHiveModel _libraryAppHiveModel = LibraryAppHiveModel();

class ShelfDetailPage extends StatefulWidget {
  const ShelfDetailPage({
    super.key,
    required this.title,
    required this.books,
    required this.deleteShelf,
    required this.index,
  });

  final String title;

  final List<BooksVO> books;
  final VoidCallback deleteShelf;
  final int index;

  @override
  State<ShelfDetailPage> createState() => _ShelfDetailPageState();
}

class _ShelfDetailPageState extends State<ShelfDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: kSP15x),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => DeleteShelfDialogView(
                    mainContext: context,
                    deleteShelf: () => widget.deleteShelf(),
                  ),
                );
              },
              child: const Icon(
                CupertinoIcons.delete,
                color: kBlackColor,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SavedBookListGridViewSessionView(
          title: widget.title,
          shelfIndex: widget.index,
          books: widget.books,
        ),
      ),
    ));
  }
}

//
//Saved Book List Grid View Session
//

class SavedBookListGridViewSessionView extends StatefulWidget {
  const SavedBookListGridViewSessionView({
    super.key,
    required this.books,
    required this.shelfIndex,
    required this.title,
  });

  final List<BooksVO> books;
  final int shelfIndex;
  final String title;

  @override
  State<SavedBookListGridViewSessionView> createState() =>
      _SavedBookListGridViewSessionViewState();
}

class _SavedBookListGridViewSessionViewState
    extends State<SavedBookListGridViewSessionView> {
  void removeBook(BooksVO book) {
    setState(() {
      List shelfList = _libraryAppHiveModel.getShelf;
      shelfList[widget.shelfIndex].books.remove(book);

      _libraryAppHiveModel.saveShelf(shelfList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: kSP30x),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                    color: kBlackColor,
                    fontSize: kFontSize30x,
                    fontWeight: FontWeight.bold),
              ),
              const Gap(kSP5x),
              Text(
                "${_libraryAppHiveModel.getShelf[widget.shelfIndex].books.length} book${_libraryAppHiveModel.getShelf[widget.shelfIndex].books.length > 1 ? 's' : ''}",
              ),
            ],
          ),
        ),
        const Divider(
          height: kSP50x,
          thickness: 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kSP15x),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.68,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 13,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1 / 2.3),
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetailPage(
                            title: widget.books[index].title,
                            author: widget.books[index].author,
                            coverImage: widget.books[index].bookImage,
                            description: widget.books[index].description,
                            price: widget.books[index].price,
                            rank: widget.books[index].rank,
                            year: widget.books[index].createdDate),
                      )),
                  onLongPress: () {
                    showModalBottomSheet(
                        isDismissible: true,
                        context: context,
                        builder: (context) => GestureDetector(
                              onTap: () {
                                removeBook(widget.books[index]);
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: kShelfDetailBottomSheetHeight,
                                padding: const EdgeInsets.only(
                                    top: kSP10x, left: kSP20x),
                                child: const Row(
                                  children: [
                                    Gap(kSP20x),
                                    Icon(Icons.delete),
                                    Gap(kSP30x),
                                    Text(kRemoveSavedBookFromShelfText)
                                  ],
                                ),
                              ),
                            ));
                  },
                  child: SavedBookGridItemView(book: widget.books[index])),
              itemCount: widget.books.length,
            ),
          ),
        ),
      ],
    );
  }
}

//
//Saved Book Grid Item View
//

class SavedBookGridItemView extends StatelessWidget {
  const SavedBookGridItemView({super.key, required this.book});

  final BooksVO book;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kShelfDetailGridItemWidth,
      child: Column(
        children: [
          SizedBox(
            height: kShelfDetailGridItemHeight,
            child: Image.network(
              book.bookImage,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(kSP15x),
          Text(
            book.title,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

//
//delete shelf dialog view
//

class DeleteShelfDialogView extends StatelessWidget {
  const DeleteShelfDialogView(
      {super.key, required this.deleteShelf, required this.mainContext});

  final VoidCallback deleteShelf;
  final BuildContext mainContext;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: kDeleteShelfDialogHeight,
        child: Column(
          children: [
            const Text(kDeleteShelfText),
            const Gap(kSP15x),
            ElevatedButton(
                onPressed: () {
                  deleteShelf();
                  Navigator.pop(context);
                  Navigator.pop(mainContext);
                },
                child: const Text("Delete"))
          ],
        ),
      ),
    );
  }
}

//
//Bottom Sheet Session View
//

class BottomSheetSessionView extends StatelessWidget {
  BottomSheetSessionView({
    super.key,
    required this.shelfIndex,
    required this.book,
  });

  final int shelfIndex;

  final BooksVO book;

  final LibraryAppHiveModel _libraryAppHiveModel = LibraryAppHiveModel();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        List shelfList = _libraryAppHiveModel.getShelf;
        shelfList[shelfIndex].books.remove(book);

        _libraryAppHiveModel.saveShelf(shelfList);
        Navigator.pop(context);
      },
      child: Container(
        height: kShelfDetailBottomSheetHeight,
        padding: const EdgeInsets.only(top: kSP10x, left: kSP20x),
        child: const Row(
          children: [
            Gap(kSP20x),
            Icon(Icons.delete),
            Gap(kSP30x),
            Text(kRemoveSavedBookFromShelfText)
          ],
        ),
      ),
    );
  }
}
