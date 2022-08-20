import 'package:hive/hive.dart';

part 'game_data.g.dart';

@HiveType(typeId: 78)
class GameData extends HiveObject {
  GameData(
      {required this.firstTeamName,
      required this.firstTeamScore,
      required this.secondTeamName,
      required this.secondTeamScore,
      required this.goalLimit});

  @HiveField(0)
  String firstTeamName;

  @HiveField(1)
  String secondTeamName;

  @HiveField(2)
  int firstTeamScore;

  @HiveField(3)
  int secondTeamScore;

  @HiveField(4)
  int? goalLimit;
}
