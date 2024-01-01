import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:library_app/data/vos/home_screen_vos/buy_links_vo.dart';
import 'package:library_app/persistent/hive_constant.dart';
part 'books_vo.g.dart';

@HiveType(typeId: kHiveBookVOTypeId)
@JsonSerializable()
class BooksVO {
  @HiveField(0)
  @JsonKey(name: "age_group")
  final String ageGroup;
  @HiveField(1)
  @JsonKey(name: "amazon_product_url")
  final String amazonProductUrl;
  @HiveField(2)
  @JsonKey(name: "article_chapter_link")
  final String articleChapterLink;
  @HiveField(3)
  final String author;
  @HiveField(4)
  @JsonKey(name: "book_image")
  final String bookImage;
  @HiveField(5)
  @JsonKey(name: "book_image_width")
  final int bookImageWidth;
  @HiveField(6)
  @JsonKey(name: "book_image_height")
  final int bookImageHeight;
  @HiveField(7)
  @JsonKey(name: "book_review_link")
  final String bookReviewLink;
  @HiveField(8)
  final String contributor;
  @HiveField(9)
  @JsonKey(name: "contributor_note")
  final String contributorNote;
  @HiveField(10)
  @JsonKey(name: "created_date")
  final String createdDate;
  @HiveField(11)
  final String description;
  @HiveField(12)
  @JsonKey(name: "first_chapter_link")
  final String firstChapterLink;
  @HiveField(13)
  final String price;
  @HiveField(14)
  @JsonKey(name: "primary_isbn10")
  final String primaryIsbn10;
  @HiveField(15)
  @JsonKey(name: "primary_isbn13")
  final String primaryIsbn13;
  @HiveField(16)
  @JsonKey(name: "book_uri")
  final String bookUri;
  @HiveField(17)
  final String publisher;
  @HiveField(18)
  final int rank;
  @HiveField(19)
  @JsonKey(name: "rank_last_week")
  final int rankLastWeek;
  @HiveField(20)
  @JsonKey(name: "sunday_review_link")
  final String sundayReviewLink;
  @HiveField(21)
  final String title;
  @HiveField(22)
  @JsonKey(name: "updated_date")
  final String updatedDate;
  @HiveField(23)
  @JsonKey(name: "weeks_on_list")
  final int weeksOnList;
  @HiveField(24)
  @JsonKey(name: "buy_links")
  final List<BuyLinksVO> buyLinks;

  BooksVO(
      {required this.ageGroup,
      required this.amazonProductUrl,
      required this.articleChapterLink,
      required this.author,
      required this.bookImage,
      required this.bookImageWidth,
      required this.bookImageHeight,
      required this.bookReviewLink,
      required this.contributor,
      required this.contributorNote,
      required this.createdDate,
      required this.description,
      required this.firstChapterLink,
      required this.price,
      required this.primaryIsbn10,
      required this.primaryIsbn13,
      required this.bookUri,
      required this.publisher,
      required this.rank,
      required this.rankLastWeek,
      required this.sundayReviewLink,
      required this.title,
      required this.updatedDate,
      required this.weeksOnList,
      required this.buyLinks});

  factory BooksVO.fromJson(Map<String, dynamic> json) =>
      _$BooksVOFromJson(json);
}
