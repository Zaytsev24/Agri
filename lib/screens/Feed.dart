import 'package:flutter/material.dart';

class FeedComponent {
  final String name;
  final double percentage;

  FeedComponent({required this.name, required this.percentage});
}

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final List<String> feeds = [];
  final TextEditingController feedController = TextEditingController();

  final List<FeedComponent> components = [];

  void addFeed() {
    if (feedController.text.isEmpty) return;
    setState(() {
      feeds.add(feedController.text);
      feedController.clear();
    });
  }

  void addComponent(String feed) {
    setState(() {
      components.add(FeedComponent(name: '$feed Component', percentage: 50));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Корма')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: TextField(controller: feedController, decoration: const InputDecoration(labelText: 'Название корма'))),
                ElevatedButton(onPressed: addFeed, child: const Text('Добавить')),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: feeds.length,
              itemBuilder: (context, index) {
                final f = feeds[index];
                return ListTile(
                  title: Text(f),
                  subtitle: Text('Компонентов: ${components.where((c) => c.name.contains(f)).length}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => addComponent(f),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
