import 'package:flutter/material.dart';

class Machine {
  final String name;
  final String fuelType;
  double fuelUsed;
  double motohours;

  Machine({required this.name, required this.fuelType, this.fuelUsed = 0, this.motohours = 0});
}

class MachineryScreen extends StatefulWidget {
  const MachineryScreen({super.key});

  @override
  State<MachineryScreen> createState() => _MachineryScreenState();
}

class _MachineryScreenState extends State<MachineryScreen> {
  final List<Machine> machines = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController fuelController = TextEditingController();

  void addMachine() {
    if (nameController.text.isEmpty || fuelController.text.isEmpty) return;
    setState(() {
      machines.add(Machine(name: nameController.text, fuelType: fuelController.text));
      nameController.clear();
      fuelController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Техника')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Название техники')),
                TextField(controller: fuelController, decoration: const InputDecoration(labelText: 'Тип топлива')),
                ElevatedButton(onPressed: addMachine, child: const Text('Добавить')),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: machines.length,
              itemBuilder: (context, index) {
                final m = machines[index];
                return ListTile(
                  title: Text(m.name),
                  subtitle: Text('Топливо: ${m.fuelType}, Пробег/моточасы: ${m.motohours}, Расход: ${m.fuelUsed}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
