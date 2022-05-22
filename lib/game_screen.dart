import 'package:flutter/material.dart';
import 'package:football_goal_app/overview_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen(
      {Key? key, required this.firstTeamName, required this.secondTeamName})
      : super(key: key);

  final String firstTeamName;
  final String secondTeamName;

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
    setState(() {
      firstTeamScore++;
    });
  }

  // This function is triggered when the second team scores a goal
  void goal2() {
    // This is to inform flutter that second team score has
    // changed and to update the UI.
    setState(() {
      secondTeamScore++;
    });
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
                    Text('$firstTeamScore',
                        style: Theme.of(context).textTheme.headline4),
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
                    Text('$secondTeamScore',
                        style: Theme.of(context).textTheme.headline4),
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
                                firstTeamName: widget.firstTeamName,
                                secondTeamName: widget.secondTeamName,
                                firstTeamScore: firstTeamScore,
                                secondTeamScore: secondTeamScore)));
                  },
                  child: const Text("End Game")),
            )
          ],
        ),
      ),
    );
  }
}
