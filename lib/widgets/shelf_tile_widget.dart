import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:library_app/constant/dimensions.dart';

class ShelfTileView extends StatelessWidget {
  const ShelfTileView(
      {super.key,
      required this.coverImage,
      required this.title,
      required this.bookCount});

  final String coverImage;
  final String title;
  final int bookCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kSP15x),
      width: MediaQuery.of(context).size.width * 0.9,
      height: kShelfTileHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: kShelfCoverImageWidth,
                height: kShelfCoverImageHeight,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(kSP15x))),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(kSP15x)),
                  child: Image.network(
                    coverImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Gap(kSP20x),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  const Gap(kSP5x),
                  Text("$bookCount book${bookCount > 1 ? 's' : ''}")
                ],
              )
            ],
          ),
          const Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
