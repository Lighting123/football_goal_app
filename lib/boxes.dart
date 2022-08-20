import 'package:football_goal_app/src/game_data.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<GameData> getGameSaves() => Hive.box<GameData>('gamesaves');
}
