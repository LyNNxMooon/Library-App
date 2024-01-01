// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelf_list_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShelfListVOAdapter extends TypeAdapter<ShelfListVO> {
  @override
  final int typeId = 4;

  @override
  ShelfListVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShelfListVO(
      fields[0] as String,
      fields[1] as String,
      (fields[2] as List?)?.cast<BooksVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, ShelfListVO obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.shelfName)
      ..writeByte(1)
      ..write(obj.cover)
      ..writeByte(2)
      ..write(obj.books);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShelfListVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
