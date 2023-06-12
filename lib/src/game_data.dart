import 'package:hive/hive.dart';

part 'game_data.g.dart';

@HiveType(typeId: 78)
class GameData extends HiveObject {
  GameData(
      {required this.firstPlayerName,
      required this.firstPlayerGoals,
      required this.secondPlayerName,
      required this.secondPlayerGoals,
      required this.goalLimit});

  @HiveField(0)
  String firstPlayerName;

  @HiveField(1)
  String secondPlayerName;

  @HiveField(2)
  List<Goal> firstPlayerGoals;

  @HiveField(3)
  List<Goal> secondPlayerGoals;

  @HiveField(4)
  int? goalLimit;
}

@HiveType(typeId: 79)
class Goal {
  Goal({required this.timeScored});

  @HiveField(0)
  DateTime timeScored;
}
