// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameDataAdapter extends TypeAdapter<GameData> {
  @override
  final int typeId = 78;

  @override
  GameData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GameData(
      firstTeamName: fields[0] as String,
      firstTeamScore: fields[2] as int,
      secondTeamName: fields[1] as String,
      secondTeamScore: fields[3] as int,
      goalLimit: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, GameData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.firstTeamName)
      ..writeByte(1)
      ..write(obj.secondTeamName)
      ..writeByte(2)
      ..write(obj.firstTeamScore)
      ..writeByte(3)
      ..write(obj.secondTeamScore)
      ..writeByte(4)
      ..write(obj.goalLimit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
