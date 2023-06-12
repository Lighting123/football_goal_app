import 'package:flutter/material.dart';
import 'package:football_goal_app/src/game_data.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/main_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(GameDataAdapter());
  Hive.registerAdapter(GoalAdapter());

  await Hive.openBox<GameData>('gamesaves');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Goal App',
      theme: ThemeData(primarySwatch: Colors.green, useMaterial3: true),
      home: const WelcomePage(),
      darkTheme: ThemeData.dark(useMaterial3: true),
    );
  }
}
