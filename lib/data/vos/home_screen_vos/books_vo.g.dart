// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BooksVOAdapter extends TypeAdapter<BooksVO> {
  @override
  final int typeId = 1;

  @override
  BooksVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BooksVO(
      ageGroup: fields[0] as String,
      amazonProductUrl: fields[1] as String,
      articleChapterLink: fields[2] as String,
      author: fields[3] as String,
      bookImage: fields[4] as String,
      bookImageWidth: fields[5] as int,
      bookImageHeight: fields[6] as int,
      bookReviewLink: fields[7] as String,
      contributor: fields[8] as String,
      contributorNote: fields[9] as String,
      createdDate: fields[10] as String,
      description: fields[11] as String,
      firstChapterLink: fields[12] as String,
      price: fields[13] as String,
      primaryIsbn10: fields[14] as String,
      primaryIsbn13: fields[15] as String,
      bookUri: fields[16] as String,
      publisher: fields[17] as String,
      rank: fields[18] as int,
      rankLastWeek: fields[19] as int,
      sundayReviewLink: fields[20] as String,
      title: fields[21] as String,
      updatedDate: fields[22] as String,
      weeksOnList: fields[23] as int,
      buyLinks: (fields[24] as List).cast<BuyLinksVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, BooksVO obj) {
    writer
      ..writeByte(25)
      ..writeByte(0)
      ..write(obj.ageGroup)
      ..writeByte(1)
      ..write(obj.amazonProductUrl)
      ..writeByte(2)
      ..write(obj.articleChapterLink)
      ..writeByte(3)
      ..write(obj.author)
      ..writeByte(4)
      ..write(obj.bookImage)
      ..writeByte(5)
      ..write(obj.bookImageWidth)
      ..writeByte(6)
      ..write(obj.bookImageHeight)
      ..writeByte(7)
      ..write(obj.bookReviewLink)
      ..writeByte(8)
      ..write(obj.contributor)
      ..writeByte(9)
      ..write(obj.contributorNote)
      ..writeByte(10)
      ..write(obj.createdDate)
      ..writeByte(11)
      ..write(obj.description)
      ..writeByte(12)
      ..write(obj.firstChapterLink)
      ..writeByte(13)
      ..write(obj.price)
      ..writeByte(14)
      ..write(obj.primaryIsbn10)
      ..writeByte(15)
      ..write(obj.primaryIsbn13)
      ..writeByte(16)
      ..write(obj.bookUri)
      ..writeByte(17)
      ..write(obj.publisher)
      ..writeByte(18)
      ..write(obj.rank)
      ..writeByte(19)
      ..write(obj.rankLastWeek)
      ..writeByte(20)
      ..write(obj.sundayReviewLink)
      ..writeByte(21)
      ..write(obj.title)
      ..writeByte(22)
      ..write(obj.updatedDate)
      ..writeByte(23)
      ..write(obj.weeksOnList)
      ..writeByte(24)
      ..write(obj.buyLinks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BooksVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BooksVO _$BooksVOFromJson(Map<String, dynamic> json) => BooksVO(
      ageGroup: json['age_group'] as String,
      amazonProductUrl: json['amazon_product_url'] as String,
      articleChapterLink: json['article_chapter_link'] as String,
      author: json['author'] as String,
      bookImage: json['book_image'] as String,
      bookImageWidth: json['book_image_width'] as int,
      bookImageHeight: json['book_image_height'] as int,
      bookReviewLink: json['book_review_link'] as String,
      contributor: json['contributor'] as String,
      contributorNote: json['contributor_note'] as String,
      createdDate: json['created_date'] as String,
      description: json['description'] as String,
      firstChapterLink: json['first_chapter_link'] as String,
      price: json['price'] as String,
      primaryIsbn10: json['primary_isbn10'] as String,
      primaryIsbn13: json['primary_isbn13'] as String,
      bookUri: json['book_uri'] as String,
      publisher: json['publisher'] as String,
      rank: json['rank'] as int,
      rankLastWeek: json['rank_last_week'] as int,
      sundayReviewLink: json['sunday_review_link'] as String,
      title: json['title'] as String,
      updatedDate: json['updated_date'] as String,
      weeksOnList: json['weeks_on_list'] as int,
      buyLinks: (json['buy_links'] as List<dynamic>)
          .map((e) => BuyLinksVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BooksVOToJson(BooksVO instance) => <String, dynamic>{
      'age_group': instance.ageGroup,
      'amazon_product_url': instance.amazonProductUrl,
      'article_chapter_link': instance.articleChapterLink,
      'author': instance.author,
      'book_image': instance.bookImage,
      'book_image_width': instance.bookImageWidth,
      'book_image_height': instance.bookImageHeight,
      'book_review_link': instance.bookReviewLink,
      'contributor': instance.contributor,
      'contributor_note': instance.contributorNote,
      'created_date': instance.createdDate,
      'description': instance.description,
      'first_chapter_link': instance.firstChapterLink,
      'price': instance.price,
      'primary_isbn10': instance.primaryIsbn10,
      'primary_isbn13': instance.primaryIsbn13,
      'book_uri': instance.bookUri,
      'publisher': instance.publisher,
      'rank': instance.rank,
      'rank_last_week': instance.rankLastWeek,
      'sunday_review_link': instance.sundayReviewLink,
      'title': instance.title,
      'updated_date': instance.updatedDate,
      'weeks_on_list': instance.weeksOnList,
      'buy_links': instance.buyLinks,
    };
