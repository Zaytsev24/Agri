import 'package:flutter/material.dart';

class Animal {
  final String id;
  final String name;
  final String parentId;
  double weight;
  double dailyGain;

  Animal({
    required this.id,
    required this.name,
    required this.parentId,
    required this.weight,
    required this.dailyGain,
  });
}

class AnimalsScreen extends StatefulWidget {
  const AnimalsScreen({super.key});

  @override
  State<AnimalsScreen> createState() => _AnimalsScreenState();
}

class _AnimalsScreenState extends State<AnimalsScreen> {
  final List<Animal> animals = [];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController parentController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  void addAnimal() {
    if (nameController.text.isEmpty || weightController.text.isEmpty) return;
    setState(() {
      animals.add(Animal(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: nameController.text,
        parentId: parentController.text,
        weight: double.tryParse(weightController.text) ?? 0,
        dailyGain: 0,
      ));
      nameController.clear();
      parentController.clear();
      weightController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Животные')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Имя')),
                TextField(controller: parentController, decoration: const InputDecoration(labelText: 'ID родителя')),
                TextField(controller: weightController, decoration: const InputDecoration(labelText: 'Вес')),
                ElevatedButton(onPressed: addAnimal, child: const Text('Добавить животное')),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: animals.length,
              itemBuilder: (context, index) {
                final a = animals[index];
                return ListTile(
                  title: Text('${a.name} (${a.weight} кг)'),
                  subtitle: Text('Родитель: ${a.parentId}, Привес: ${a.dailyGain} кг/день'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
