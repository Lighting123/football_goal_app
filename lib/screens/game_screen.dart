import 'package:flutter/material.dart';
import 'package:football_goal_app/src/game_data.dart';

import 'overview_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen(
    this.firstPlayerName,
    this.secondPlayerName, {
    Key? key,
    this.goalLimit,
  }) : super(key: key);

  final String firstPlayerName;
  final String secondPlayerName;
  final int? goalLimit;

  @override
  // ignore: library_private_types_in_public_api
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // This is the list of goals scored by the first player
  List<Goal> firstPlayerGoals = [];

  // This is the list of goals scored by the second player
  List<Goal> secondPlayerGoals = [];

  // This function is triggered when the first team scores a goal
  void goal1() {
    // This is to inform flutter that first team score has
    // changed and to update the UI.
    if (firstPlayerGoals.length == widget.goalLimit) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OverviewScreen(
                    widget.firstPlayerName,
                    widget.secondPlayerName,
                    firstPlayerGoals,
                    secondPlayerGoals,
                    goalLimit: widget.goalLimit,
                  )));
    } else {
      setState(() {
        firstPlayerGoals.add(Goal(timeScored: DateTime.now()));
      });
    }
  }

  // This function is triggered when the second team scores a goal
  void goal2() {
    // This is to inform flutter that second team score has
    // changed and to update the UI.
    if (secondPlayerGoals.length == widget.goalLimit) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OverviewScreen(
                    widget.firstPlayerName,
                    widget.secondPlayerName,
                    firstPlayerGoals,
                    secondPlayerGoals,
                    goalLimit: widget.goalLimit,
                  )));
    } else {
      setState(() {
        secondPlayerGoals.add(Goal(timeScored: DateTime.now()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game"),
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
                    Text(widget.firstPlayerName),
                    const SizedBox(width: 20, height: 20),
                    GoalScoreText(
                      goalLimit: widget.goalLimit,
                      playerScore: firstPlayerGoals.length,
                    ),
                    const SizedBox(width: 10, height: 10),
                    OutlinedButton(onPressed: goal1, child: const Text("GOAL!"))
                  ],
                ),
                const SizedBox(width: 100, height: 100),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.secondPlayerName),
                    const SizedBox(width: 20, height: 20),
                    GoalScoreText(
                      goalLimit: widget.goalLimit,
                      playerScore: secondPlayerGoals.length,
                    ),
                    const SizedBox(width: 10, height: 10),
                    OutlinedButton(
                        onPressed: goal2, child: const Text("GOAL!!"))
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OverviewScreen(
                                  widget.firstPlayerName,
                                  widget.secondPlayerName,
                                  firstPlayerGoals,
                                  secondPlayerGoals,
                                  goalLimit: widget.goalLimit,
                                )));
                  },
                  child: const Text("End Game")),
            )
          ],
        ),
      ),
    );
  }
}

class GoalScoreText extends StatelessWidget {
  const GoalScoreText(
      {Key? key, required this.goalLimit, required this.playerScore})
      : super(key: key);

  final int playerScore;
  final int? goalLimit;

  @override
  Widget build(BuildContext context) {
    if (goalLimit == null) {
      return Text('$playerScore',
          style: Theme.of(context).textTheme.titleLarge);
    } else {
      return Text('$playerScore/$goalLimit',
          style: Theme.of(context).textTheme.titleLarge);
    }
  }
}
