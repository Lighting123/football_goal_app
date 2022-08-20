import 'package:flutter/material.dart';
import 'package:football_goal_app/list.dart';

import 'names_screen.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Start the game"),
            const SizedBox(width: 20, height: 20),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NamesScreen()),
                  );
                },
                child: const Text("Start Game")),
            const SizedBox(width: 10, height: 10),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ListScreen()),
                  );
                },
                child: const Text("List"))
          ],
        ),
      ),
    );
  }
}
