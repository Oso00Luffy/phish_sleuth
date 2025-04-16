// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_challenge.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeeklyChallengeAdapter extends TypeAdapter<WeeklyChallenge> {
  @override
  final int typeId = 1;

  @override
  WeeklyChallenge read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeeklyChallenge(
      sender: fields[0] as String,
      message: fields[1] as String,
      userResponse: fields[2] as bool?,
      points: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, WeeklyChallenge obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.sender)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.userResponse)
      ..writeByte(3)
      ..write(obj.points);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeeklyChallengeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
