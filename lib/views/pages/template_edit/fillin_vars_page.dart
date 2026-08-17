import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:summon_tracker/notifiers/edit_template_notifier.dart';
import 'package:summon_tracker/views/widgets/help_button.dart';
import 'package:summon_tracker/views/widgets/separator_title.dart';
import 'package:summon_tracker/views/widgets/template_editing/my_text_field.dart';

class FillinVarsPage extends ConsumerStatefulWidget {
  const FillinVarsPage({super.key});

  @override
  ConsumerState<FillinVarsPage> createState() => _FillinVarsPageState();
}

class _FillinVarsPageState extends ConsumerState<FillinVarsPage> {
  static const _setSummonHelp = '''
if this box is checked, you will set the value
each time you summon this creature individualy
if it is unchecked, all summoned instances will use the same value
''';

  static const _varNameHelp = '''
Give the variable a name that's
readable and easy to remember 
''';

  static const _valueHelp = '''
The number to insert where you placed this variable
''';

  EditTemplateNotifier get notifier => ref.read(editTemplateProvider.notifier);
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editTemplateProvider);
    final vars = state.variableTags.toList();
    final varState = state.variableState;
    final varNames = state.variableNames;

    // value = ...
    // null, number => show value field
    // text => hide value field
    return Column(
      children: [
        SeparatorTitle(title: 'Variables'),
        Expanded(
          child: ListView.builder(
            itemCount: vars.length,
            itemBuilder: (BuildContext context, int index) {
              final tag = vars[index];
              final value = varState[tag];

              final bool setOnSummon =
                  value != null && int.tryParse(value) == null;
              return ListTile(
                isThreeLine: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tag,
                      style: TextStyle(fontSize: 20),
                    ),
                    _checkBox(
                      tag,
                      int.tryParse(value ?? '0') == null,
                    ),
                  ],
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: MyTextField(
                        label: 'Variable name',
                        initialValue: varNames[tag],
                        onChanged: (name) {
                          notifier.setVariableName(tag, name);
                        },
                      ),
                    ),
                    if (!setOnSummon)
                      SizedBox(
                        width: 100,
                        child: MyTextField.digitsOnly(
                          label: 'Value',
                          initialValue: value,
                          onChanged: (value) {
                            final int? number = int.tryParse(value ?? '.');
                            if (number == null) return;
                            notifier.setVariableValue(tag, number);
                          },
                        ),
                      ),
                    HelpButton(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Variable Name',
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            _varNameHelp,
                            style: TextStyle(color: Colors.black),
                          ),
                          if (!setOnSummon) ...[
                            Text(
                              'Value',
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              _valueHelp,
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _checkBox(String tag, bool isInst) => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      const Text('set on summon'),
      Checkbox(
        value: isInst,
        onChanged: (value) {
          notifier.setVariableInstance(tag, value ?? false);
        },
      ),
      HelpButton(
        child: Text(
          _setSummonHelp,
          style: TextStyle(color: Colors.black),
        ),
      ),
    ],
  );
}
