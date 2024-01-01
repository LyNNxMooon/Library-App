// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_book_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteBookListAdapter extends TypeAdapter<FavoriteBookList> {
  @override
  final int typeId = 8;

  @override
  FavoriteBookList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteBookList(
      fields[0] as String,
      (fields[1] as List?)?.cast<BooksVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteBookList obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.listName)
      ..writeByte(1)
      ..write(obj.favoriteBooksList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteBookListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
