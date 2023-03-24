import 'package:flutter/material.dart';
import 'package:football_goal_app/boxes.dart';
import 'package:football_goal_app/src/game_data.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Of Games"),
      ),
      body: ValueListenableBuilder<Box<GameData>>(
          valueListenable: Boxes.getGameSaves().listenable(),
          builder: (context, box, _) {
            final gameSaves = box.values.toList().cast<GameData>();
            return ListView.builder(
                itemCount: gameSaves.length,
                itemBuilder: (context, index) {
                  return ListItem(index: index, data: gameSaves[index]);
                });
          }),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.index, required this.data})
      : super(key: key);

  final int index;
  final GameData data;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "$index.",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(data.firstTeamName),
                Text(data.firstTeamScore.toString())
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(data.secondTeamName),
                Text(data.secondTeamScore.toString())
              ],
            ),
          )
        ]),
        Padding(padding: const EdgeInsets.all(8.0), child: WinText(data: data)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton.icon(
              onPressed: () {
                data.delete();
              },
              icon: const Icon(Icons.delete_outline_rounded),
              label: const Text("Delete")),
        )
      ],
    ));
  }
}

class WinText extends StatelessWidget {
  const WinText({Key? key, required this.data}) : super(key: key);

  final GameData data;
  @override
  Widget build(BuildContext context) {
    if (data.firstTeamScore == data.goalLimit) {
      return Text("${data.firstTeamName} Won.");
    } else if (data.secondTeamScore == data.goalLimit) {
      return Text("${data.secondTeamName} Won.");
    } else {
      return const Text("No goal limit or no team won.");
    }
  }
}
