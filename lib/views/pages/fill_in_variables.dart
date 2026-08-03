import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:summon_tracker/models/summon_template.dart';

class FillInVariables extends StatefulWidget {
  final SummonTemplate summonData;
  const FillInVariables({required this.summonData, super.key});

  @override
  State<FillInVariables> createState() => _FillInVariablesState();
}

class _FillInVariablesState extends State<FillInVariables> {
  late final Map<String, int?> filledIn;
  late final Map<String, TextEditingController> controllers;

  bool showErrors = false;

  @override
  void initState() {
    super.initState();
    final tags = widget.summonData.variableTags;
    filledIn = Map.fromEntries(
      tags.map((e) {
        return MapEntry<String, int?>(e, null);
      }),
    );

    controllers = Map.fromEntries(
      tags.map((e) => MapEntry(e, TextEditingController())),
    );
  }

  @override
  void dispose() {
    for (final c in controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          for (final key in filledIn.keys)
            Row(
              children: [
                Text('$key:'),
                Expanded(
                  child: TextField(
                    controller: controllers[key],
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      error: showErrors && filledIn[key] == null
                          ? Text('lala')
                          : null,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
