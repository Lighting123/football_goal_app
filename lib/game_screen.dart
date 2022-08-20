import 'package:flutter/material.dart';
import 'package:football_goal_app/overview_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen(
    this.firstTeamName,
    this.secondTeamName, {
    Key? key,
    this.goalLimit,
  }) : super(key: key);

  final String firstTeamName;
  final String secondTeamName;
  final int? goalLimit;

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // This is the first team score
  int firstTeamScore = 0;

  // This is the second team score
  int secondTeamScore = 0;

  // This function is triggered when the first team scores a goal
  void goal1() {
    // This is to inform flutter that first team score has
    // changed and to update the UI.
    if (firstTeamScore == widget.goalLimit) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OverviewScreen(
                    widget.firstTeamName,
                    widget.secondTeamName,
                    firstTeamScore,
                    secondTeamScore,
                    goalLimit: widget.goalLimit,
                  )));
    } else {
      setState(() {
        firstTeamScore++;
      });
    }
  }

  // This function is triggered when the second team scores a goal
  void goal2() {
    // This is to inform flutter that second team score has
    // changed and to update the UI.
    if (secondTeamScore == widget.goalLimit) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OverviewScreen(
                    widget.firstTeamName,
                    widget.secondTeamName,
                    firstTeamScore,
                    secondTeamScore,
                    goalLimit: widget.goalLimit,
                  )));
    } else {
      setState(() {
        secondTeamScore++;
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
                    Text(widget.firstTeamName),
                    const SizedBox(width: 20, height: 20),
                    GoalScoreText(
                      goalLimit: widget.goalLimit,
                      teamScore: firstTeamScore,
                    ),
                    const SizedBox(width: 10, height: 10),
                    OutlinedButton(onPressed: goal1, child: const Text("GOAL!"))
                  ],
                ),
                const SizedBox(width: 100, height: 100),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.secondTeamName),
                    const SizedBox(width: 20, height: 20),
                    GoalScoreText(
                      goalLimit: widget.goalLimit,
                      teamScore: secondTeamScore,
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
                                  widget.firstTeamName,
                                  widget.secondTeamName,
                                  firstTeamScore,
                                  secondTeamScore,
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
      {Key? key, required this.goalLimit, required this.teamScore})
      : super(key: key);

  final int teamScore;
  final int? goalLimit;

  @override
  Widget build(BuildContext context) {
    if (goalLimit == null) {
      return Text('$teamScore', style: Theme.of(context).textTheme.headline6);
    } else {
      return Text('$teamScore/$goalLimit',
          style: Theme.of(context).textTheme.headline6);
    }
  }
}
