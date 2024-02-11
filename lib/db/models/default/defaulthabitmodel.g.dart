// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defaulthabitmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DefaultItemsAdapter extends TypeAdapter<DefaultItems> {
  @override
  final int typeId = 4;

  @override
  DefaultItems read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DefaultItems(
      habitsname: fields[0] as String,
      images: fields[1] as String,
      description: fields[2] as String,
      keyResults: (fields[3] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, DefaultItems obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.habitsname)
      ..writeByte(1)
      ..write(obj.images)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.keyResults);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DefaultItemsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
