// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_links_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BuyLinksVOAdapter extends TypeAdapter<BuyLinksVO> {
  @override
  final int typeId = 2;

  @override
  BuyLinksVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BuyLinksVO(
      name: fields[0] as String,
      url: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BuyLinksVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BuyLinksVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyLinksVO _$BuyLinksVOFromJson(Map<String, dynamic> json) => BuyLinksVO(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$BuyLinksVOToJson(BuyLinksVO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
