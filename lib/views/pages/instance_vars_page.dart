import 'package:flutter/material.dart';
import 'package:summon_tracker/logic/models/summons/summon_variant.dart';
import 'package:summon_tracker/views/widgets/help_button.dart';
import 'package:summon_tracker/views/widgets/separator_title.dart';
import 'package:summon_tracker/views/widgets/template_editing/my_text_field.dart';

class InstanceVarsPage extends StatefulWidget {
  final SummonVariant variant;
  const InstanceVarsPage({super.key, required this.variant});

  @override
  State<InstanceVarsPage> createState() => _InstanceVarsPageState();
}

class _InstanceVarsPageState extends State<InstanceVarsPage> {
  @override
  Widget build(BuildContext context) {
    final variables = widget.variant.instanceVariables;
    return Scaffold(
      appBar: AppBar(
        title: SeparatorTitle(title: 'Set your variables'),
      ),
      body: Column(
        children: [
          ...variables.map(
            (variable) => ListTile(
              isThreeLine: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    variable.tag,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              subtitle: Row(
                children: [
                  Expanded(
                    child: Text(
                      variable.displayName,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: MyTextField.digitsOnly(
                      label: 'Value',
                      onChanged: (value) {
                        final int? number = int.tryParse(value ?? '.');
                        if (number == null) return;
                      },
                    ),
                  ),
                  HelpButton(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
