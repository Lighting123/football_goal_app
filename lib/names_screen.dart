import 'package:flutter/material.dart';
import 'package:football_goal_app/mobile_logic.dart';

import 'game_screen.dart';

class NamesScreen extends StatefulWidget {
  const NamesScreen({Key? key}) : super(key: key);

  @override
  _NamesScreenState createState() => _NamesScreenState();
}

class _NamesScreenState extends State<NamesScreen> {
  final firstNameEditController = TextEditingController();
  final secondNameEditController = TextEditingController();
  final goalLimitController = TextEditingController();

  @override
  void dispose() {
    firstNameEditController.dispose();
    secondNameEditController.dispose();
    goalLimitController.dispose();
    super.dispose();
  }

  int? getGoalLimit() {
    if (goalLimitController.text.isNotEmpty) {
      int? temp;
      try {
        temp = int.parse(goalLimitController.text);
      } catch (e) {
        temp = null;
      }
      return temp;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter your names"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Enter your team names:"),
            const SizedBox(width: 20, height: 20),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: adjustPaddingSizeForMobile().toDouble(),
                  vertical: 16),
              child: TextField(
                controller: firstNameEditController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter first team name',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: adjustPaddingSizeForMobile().toDouble(),
                  vertical: 16),
              child: TextField(
                controller: secondNameEditController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter second team name',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: adjustPaddingSizeForMobile().toDouble(),
                  vertical: 16),
              child: TextField(
                controller: goalLimitController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the number of goals to win',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GameScreen(
                                  firstNameEditController.text,
                                  secondNameEditController.text,
                                  goalLimit: getGoalLimit(),
                                )));
                  },
                  child: const Text("Enter")),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GameScreen(
                                  "First Team",
                                  "Second Team",
                                  goalLimit: 5,
                                )));
                  },
                  child: const Text("Skip")),
            )
          ],
        ),
      ),
    );
  }
}
