// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_registermodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserRegisterModelAdapter extends TypeAdapter<UserRegisterModel> {
  @override
  final int typeId = 1;

  @override
  UserRegisterModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserRegisterModel(
      id: fields[0] as int?,
      username: fields[1] as String?,
      age: fields[2] as String?,
      height: fields[3] as String?,
      email: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserRegisterModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.height)
      ..writeByte(4)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserRegisterModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
