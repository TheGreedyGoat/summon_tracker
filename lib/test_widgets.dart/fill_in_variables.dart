import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:summon_tracker/summon.dart';
import 'package:summon_tracker/test_widgets.dart/summon_display_calced.dart';
import 'package:summon_tracker/widget_tree.dart';

class FillInVariables extends StatefulWidget {
  final SummonData summonData;
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
    return WidgetTree(
      appBarTitle: Text('Fill in'),
      body: Center(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bool hasblanks = false;
          for (final tag in controllers.keys) {
            final int? input = int.tryParse(controllers[tag]!.text);
            filledIn[tag] = input;
            if (filledIn[tag] == null) {
              hasblanks = true;
            }
          }

          if (hasblanks) {
            print('blanks');
            setState(() {
              showErrors = true;
            });
          } else {
            final variables = Map<String, int>.fromEntries(
              filledIn.keys.map(
                (key) => MapEntry<String, int>(key, filledIn[key]!),
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WidgetTree(
                  appBarTitle: Text('Calced'),
                  body: SummonDisplayCalced(
                    summonData: widget.summonData,
                    variables: variables,
                  ),
                ),
              ),
            );
          }
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
