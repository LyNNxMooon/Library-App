import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:library_app/constant/colors.dart';
import 'package:library_app/constant/dimensions.dart';
import 'package:library_app/constant/strings.dart';
import 'package:library_app/pages/search_book_page.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SearchBookPage(),
          )),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: kSP20x),
        width: MediaQuery.of(context).size.width * 0.9,
        height: kSearchBarHeight,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(kSP15x)),
            border: Border.all(color: kBlackColor)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kSP15x),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.search,
                    color: kBlackColor,
                  ),
                  Gap(kSP25x),
                  Text(kSearchBarText)
                ],
              ),
              Container(
                width: kSearchBarIconSquareLength,
                height: kSearchBarIconSquareLength,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(kSP20x)),
                    color: kGreyColor),
                child: const Icon(Icons.person),
              )
            ],
          ),
        ),
      ),
    );
  }
}
