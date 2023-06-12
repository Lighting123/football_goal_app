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
      firstPlayerName: fields[0] as String,
      firstPlayerGoals: (fields[2] as List).cast<Goal>(),
      secondPlayerName: fields[1] as String,
      secondPlayerGoals: (fields[3] as List).cast<Goal>(),
      goalLimit: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, GameData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.firstPlayerName)
      ..writeByte(1)
      ..write(obj.secondPlayerName)
      ..writeByte(2)
      ..write(obj.firstPlayerGoals)
      ..writeByte(3)
      ..write(obj.secondPlayerGoals)
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

class GoalAdapter extends TypeAdapter<Goal> {
  @override
  final int typeId = 79;

  @override
  Goal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Goal(
      timeScored: fields[0] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Goal obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.timeScored);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GoalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
