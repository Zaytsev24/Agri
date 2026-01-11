import 'package:flutter/material.dart';
import 'screens/animals.dart';
import 'screens/feed.dart';
import 'screens/machinery.dart';
import 'screens/finance.dart';
import 'screens/tasks.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgriControl',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AgriControl')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Животные'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AnimalsScreen()),
            ),
          ),
          ListTile(
            title: const Text('Корма'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const FeedScreen()),
            ),
          ),
          ListTile(
            title: const Text('Техника'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MachineryScreen()),
            ),
          ),
          ListTile(
            title: const Text('Финансы'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const FinanceScreen()),
            ),
          ),
          ListTile(
            title: const Text('Задачи'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TasksScreen()),
            ),
          ),
        ],
      ),
    );
  }
}
