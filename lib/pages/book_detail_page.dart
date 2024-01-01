import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:library_app/constant/colors.dart';
import 'package:library_app/constant/dimensions.dart';
import 'package:library_app/constant/strings.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({
    super.key,
    required this.title,
    required this.coverImage,
    required this.author,
    required this.price,
    required this.description,
    required this.rank,
    required this.year,
  });

  final String title;
  final String coverImage;
  final String author;
  final String price;
  final String description;
  final int rank;
  final String year;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: kBlackColor,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSP15x),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(kSP20x),
              BookMainComponentsRowSessionView(
                author: author,
                coverImage: coverImage,
                title: title,
              ),
              const Gap(kSP40x),
              BookDetailsComponentsSessionView(
                  rank: rank, year: year, price: price),
              const Divider(
                height: kSP50x,
                thickness: 2,
              ),
              DescriptionSessionView(description: description),
              const Divider(
                height: kSP50x,
                thickness: 2,
              ),
              const RatingSessionView()
            ],
          ),
        ),
      ),
    ));
  }
}

//
//Book Image, title, author Session
//

class BookMainComponentsRowSessionView extends StatelessWidget {
  const BookMainComponentsRowSessionView(
      {super.key,
      required this.coverImage,
      required this.title,
      required this.author});

  final String coverImage;
  final String title;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(kSP20x))),
          width: kBookItemWidth,
          height: kBookItemHeight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(kSP20x),
            child: Image.network(
              coverImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Gap(kSP20x),
        SizedBox(
          width: kBookDetailPageNameBoxWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: kFontSize18x, fontWeight: FontWeight.bold),
              ),
              const Gap(kSP15x),
              Text(
                author,
                style: const TextStyle(fontSize: kFontSize16x),
              )
            ],
          ),
        )
      ],
    );
  }
}

//
//Book Details Components Session
//

class BookDetailsComponentsSessionView extends StatelessWidget {
  const BookDetailsComponentsSessionView(
      {super.key, required this.rank, required this.year, required this.price});

  final int rank;
  final String year;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text(
                  "Rank",
                  style: TextStyle(
                      fontSize: kFontSize16x, fontWeight: FontWeight.bold),
                ),
                const Gap(kSP10x),
                Text("$rank")
              ],
            ),
            const SizedBox(
              height: kVerticalDividerHeight,
              child: VerticalDivider(
                thickness: 2,
                //color: kBlackColor,
                width: kSP100x,
              ),
            ),
            const Column(
              children: [
                Icon(
                  Icons.book,
                  size: kSP27x,
                ),
                Gap(kSP5x),
                Text("E book")
              ],
            ),
            const SizedBox(
              height: kVerticalDividerHeight,
              child: VerticalDivider(
                thickness: 2,
                //color: kBlackColor,
                width: kSP100x,
              ),
            ),
            Column(
              children: [
                const Text(
                  "Year",
                  style: TextStyle(
                      fontSize: kFontSize16x, fontWeight: FontWeight.bold),
                ),
                const Gap(kSP10x),
                Text(year.substring(0, 4))
              ],
            ),
          ],
        ),
        const Gap(kSP20x),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: kDetailButtonWidth,
              height: kDetailButtonHeight,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: kSecondaryColor),
                  borderRadius: BorderRadius.circular(kSP15x)),
              child: const Center(
                  child: Text(
                "Free Sample",
                style: TextStyle(color: kSecondaryColor),
              )),
            ),
            const Gap(kSP10x),
            Container(
              width: kDetailButtonWidth,
              height: kDetailButtonHeight,
              decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.circular(kSP15x)),
              child: Center(
                  child: Text(
                "\$$price",
                style: const TextStyle(color: kPrimaryColor),
              )),
            ),
          ],
        )
      ],
    );
  }
}

//
//Description Session
//

class DescriptionSessionView extends StatelessWidget {
  const DescriptionSessionView({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "About the book",
          style: TextStyle(fontSize: kFontSize16x, fontWeight: FontWeight.bold),
        ),
        const Gap(kSP20x),
        Text(
          description,
          textAlign: TextAlign.justify,
        )
      ],
    );
  }
}

//
//Rating Session View
//

class RatingSessionView extends StatelessWidget {
  const RatingSessionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Rate this book",
          style: TextStyle(fontSize: kFontSize16x, fontWeight: FontWeight.bold),
        ),
        const Gap(kSP20x),
        const Text(
          kDetailPageRatingText,
          textAlign: TextAlign.justify,
        ),
        const Gap(kSP25x),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(kSP25x),
            Icon(
              Icons.star_outline_rounded,
              size: kSP35x,
            ),
            Gap(kSP25x),
            Icon(
              Icons.star_outline_rounded,
              size: kSP35x,
            ),
            Gap(kSP25x),
            Icon(
              Icons.star_outline_rounded,
              size: kSP35x,
            ),
            Gap(kSP25x),
            Icon(
              Icons.star_outline_rounded,
              size: kSP35x,
            ),
            Gap(kSP25x),
            Icon(
              Icons.star_outline_rounded,
              size: kSP35x,
            ),
            Gap(kSP25x),
          ],
        ),
        const Gap(kSP20x),
        Center(
          child: Container(
            width: 110,
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(kSP10x)),
            child: const Center(
              child: Text("Write a review"),
            ),
          ),
        )
      ],
    );
  }
}
