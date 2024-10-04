// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memorisation_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MemorisationModelAdapter extends TypeAdapter<MemorisationModel> {
  @override
  final int typeId = 0;

  @override
  MemorisationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MemorisationModel(
      word: fields[0] as String,
      transcription: fields[1] as String,
      isLearned: fields[2] as bool,
      translation: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MemorisationModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.word)
      ..writeByte(1)
      ..write(obj.transcription)
      ..writeByte(2)
      ..write(obj.isLearned)
      ..writeByte(3)
      ..write(obj.translation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemorisationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
