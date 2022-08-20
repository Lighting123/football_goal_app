import 'package:flutter/material.dart';
import 'package:football_goal_app/boxes.dart';
import 'package:football_goal_app/main_screen.dart';
import 'package:football_goal_app/names_screen.dart';
import 'package:football_goal_app/src/game_data.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen(
    this.firstTeamName,
    this.secondTeamName,
    this.firstTeamScore,
    this.secondTeamScore, {
    Key? key,
    this.goalLimit,
  }) : super(key: key);

  final String firstTeamName;
  final String secondTeamName;
  final int firstTeamScore;
  final int secondTeamScore;
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
                      Text(firstTeamName),
                      const SizedBox(width: 20, height: 20),
                      Text('$firstTeamScore',
                          style: Theme.of(context).textTheme.headline6),
                    ],
                  ),
                  const SizedBox(width: 100, height: 100),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(secondTeamName),
                      const SizedBox(width: 20, height: 20),
                      Text(
                        '$secondTeamScore',
                        style: Theme.of(context).textTheme.headline6,
                      )
                    ],
                  ),
                ],
              ),
              WinText(
                firstTeamName: firstTeamName,
                secondTeamName: secondTeamName,
                secondTeamScore: secondTeamScore,
                firstTeamScore: firstTeamScore,
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
            addGameSave(firstTeamName, secondTeamName, firstTeamScore,
                secondTeamScore, goalLimit);
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
    required this.firstTeamName,
    required this.secondTeamName,
    required this.firstTeamScore,
    required this.secondTeamScore,
  }) : super(key: key);

  final int? goalLimit;
  final String firstTeamName;
  final String secondTeamName;
  final int firstTeamScore;
  final int secondTeamScore;
  @override
  Widget build(BuildContext context) {
    if (firstTeamScore == goalLimit) {
      return Text("$firstTeamName Won");
    } else if (secondTeamScore == goalLimit) {
      return Text("$secondTeamName Won");
    } else {
      return const Text("No goal limit or no team won");
    }
  }
}

Future addGameSave(String firstTeamName, String secondTeamName,
    int firstTeamScore, int secondTeamScore, int? goalLimt) async {
  final gameSave = GameData(
      firstTeamName: firstTeamName,
      firstTeamScore: firstTeamScore,
      secondTeamName: secondTeamName,
      secondTeamScore: secondTeamScore,
      goalLimit: goalLimt);

  final box = Boxes.getGameSaves();
  box.add(gameSave);
}
