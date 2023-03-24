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
  int? goalLimit;
int? nullNum;

  @override
  void dispose() {
    firstNameEditController.dispose();
    secondNameEditController.dispose();
    super.dispose();
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
                child: DropdownButton(
                  value: goalLimit,
                  items: [
const DropdownMenuItem(value: 2, child: Text("2")),
                    const DropdownMenuItem(value: 5, child: Text("5")),
                    const DropdownMenuItem(value: 10, child: Text("10")),
    DropdownMenuItem(value: nullNum, child: const Text("None")),
                  ],
                  onChanged: (value) {
                    if (value is int) {
                      setState(() {
                        goalLimit = value;
                      });
                    } else {}
                  },
                  isExpanded: true,
                )),
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
                                  goalLimit: goalLimit,
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
