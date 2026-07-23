import 'package:flutter/material.dart';
import 'package:summon_tracker/variables.dart';

class AddVariable extends StatefulWidget {
  final void Function() onChanged;

  const AddVariable({required this.onChanged, super.key});

  @override
  State<AddVariable> createState() => _AddVariableState();
}

class _AddVariableState extends State<AddVariable> {
  final TextEditingController tagController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController valueController = TextEditingController();
  dispose() {
    super.dispose();
    tagController.dispose();
    nameController.dispose();
    valueController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Row(
        spacing: 30,
        children: [
          Expanded(
            child: TextField(
              controller: tagController,
              decoration: InputDecoration(label: Text('Tag')),
            ),
          ),
          Expanded(
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(label: Text('Name')),
            ),
          ),
          Expanded(
            child: TextField(
              controller: valueController,
              decoration: InputDecoration(label: Text('Wert')),
            ),
          ),
          IconButton(
            onPressed: () {
              if (tagController.text.isEmpty ||
                  VariableService.instance.containsTag(tagController.text) ||
                  nameController.text.isEmpty ||
                  valueController.text.isEmpty ||
                  int.tryParse(valueController.text) == null) {
                return;
              }
              VariableService.instance.addVariable(
                nameController.text,
                tagController.text,
                int.parse(valueController.text),
              );
              widget.onChanged();
              tagController.clear();
              nameController.clear();
              valueController.clear();
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
