// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentModelAdapter extends TypeAdapter<StudentModel> {
  @override
  final int typeId = 1;

  @override
  StudentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentModel(
      id: fields[5] as int?,
      profile_image: fields[4] as String,
      name: fields[0] as dynamic,
      age: fields[1] as dynamic,
      batch: fields[2] as dynamic,
      year: fields[3] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, StudentModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.batch)
      ..writeByte(3)
      ..write(obj.year)
      ..writeByte(4)
      ..write(obj.profile_image)
      ..writeByte(5)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
