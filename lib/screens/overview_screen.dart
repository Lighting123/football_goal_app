import 'package:flutter/material.dart';
import 'package:football_goal_app/boxes.dart';
import 'package:football_goal_app/src/game_data.dart';

import 'main_screen.dart';
import 'names_screen.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen(
    this.firstPlayerName,
    this.secondPlayerName,
    this.firstPlayerGoals,
    this.secondPlayerGoals, {
    Key? key,
    this.goalLimit,
  }) : super(key: key);

  final String firstPlayerName;
  final String secondPlayerName;
  final List<Goal> firstPlayerGoals;
  final List<Goal> secondPlayerGoals;
  final int? goalLimit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Game Overview"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(firstPlayerName),
                      const SizedBox(width: 20, height: 20),
                      Text('${firstPlayerGoals.length}',
                          style: Theme.of(context).textTheme.titleLarge),
                    ],
                  ),
                  const SizedBox(width: 100, height: 100),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(secondPlayerName),
                      const SizedBox(width: 20, height: 20),
                      Text(
                        '${secondPlayerGoals.length}',
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    ],
                  ),
                ],
              ),
              WinText(
                firstPlayerName: firstPlayerName,
                secondPlayerName: secondPlayerName,
                secondPlayerGoals: secondPlayerGoals,
                firstPlayerGoals: firstPlayerGoals,
                goalLimit: goalLimit,
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NamesScreen()));
                    },
                    child: const Text("Play again")),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addGameSave(firstPlayerName, secondPlayerName, firstPlayerGoals,
                secondPlayerGoals, goalLimit);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const WelcomePage()));
          },
          tooltip: "Save Game",
          child: const Icon(Icons.save_rounded),
        ));
  }
}

class WinText extends StatelessWidget {
  const WinText({
    Key? key,
    required this.goalLimit,
    required this.firstPlayerName,
    required this.secondPlayerName,
    required this.firstPlayerGoals,
    required this.secondPlayerGoals,
  }) : super(key: key);

  final int? goalLimit;
  final String firstPlayerName;
  final String secondPlayerName;
  final List<Goal> firstPlayerGoals;
  final List<Goal> secondPlayerGoals;
  @override
  Widget build(BuildContext context) {
    if (firstPlayerGoals.length == goalLimit) {
      return Text("$firstPlayerName Won");
    } else if (secondPlayerGoals.length == goalLimit) {
      return Text("$secondPlayerName Won");
    } else {
      return const Text("No goal limit or no team won");
    }
  }
}

Future addGameSave(
    String firstPlayerName,
    String secondPlayerName,
    List<Goal> firstPlayerGoals,
    List<Goal> secondPlayerGoals,
    int? goalLimt) async {
  final gameSave = GameData(
      firstPlayerName: firstPlayerName,
      firstPlayerGoals: firstPlayerGoals,
      secondPlayerName: secondPlayerName,
      secondPlayerGoals: secondPlayerGoals,
      goalLimit: goalLimt);

  final box = Boxes.getGameSaves();
  box.add(gameSave);
}
