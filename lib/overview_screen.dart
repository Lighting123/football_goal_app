import 'package:flutter/material.dart';
import 'package:football_goal_app/main_screen.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen(
      {Key? key,
      required this.firstTeamName,
      required this.secondTeamName,
      required this.firstTeamScore,
      required this.secondTeamScore})
      : super(key: key);

  final String firstTeamName;
  final String secondTeamName;
  final int firstTeamScore;
  final int secondTeamScore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game Overview"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(firstTeamName),
                const SizedBox(width: 20, height: 20),
                Text('$firstTeamScore',
                    style: Theme.of(context).textTheme.headline4),
              ],
            ),
            const SizedBox(width: 150, height: 150),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(secondTeamName),
                const SizedBox(width: 20, height: 20),
                Text(
                  '$secondTeamScore',
                  style: Theme.of(context).textTheme.headline4,
                )
              ],
            ),
            const SizedBox(width: 100, height: 100),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WelcomePage()));
                    },
                    child: const Text("Play again")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
