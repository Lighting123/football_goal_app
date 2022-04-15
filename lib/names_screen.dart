import 'package:flutter/material.dart';

import 'game_screen.dart';

class NamesScreen extends StatefulWidget {
  const NamesScreen({Key? key}) : super(key: key);

  @override
  _NamesScreenState createState() => _NamesScreenState();
}

class _NamesScreenState extends State<NamesScreen> {
  final firstNameEditController = TextEditingController();
  final secondNameEditController = TextEditingController();

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
              padding:
                  const EdgeInsets.symmetric(horizontal: 450, vertical: 16),
              child: TextField(
                controller: firstNameEditController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Enter first team name',
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 450, vertical: 16),
              child: TextField(
                controller: secondNameEditController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Enter second team name',
                ),
              ),
            ),
            const SizedBox(width: 40, height: 40),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GameScreen(
                                firstTeamName: firstNameEditController.text,
                                secondTeamName: secondNameEditController.text,
                              )));
                },
                child: const Text("Enter"))
          ],
        ),
      ),
    );
  }
}
