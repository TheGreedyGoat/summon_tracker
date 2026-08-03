import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:summon_tracker/models/stat_expression.dart';
import 'package:summon_tracker/models/summon_example.dart';
import 'package:summon_tracker/models/summon_template.dart';
import 'package:summon_tracker/views/pages/fill_in_variables.dart';
import 'package:summon_tracker/views/widget_tree_notifier.dart';

class SummonEditPage extends ConsumerStatefulWidget {
  final SummonTemplate? summonData;
  const SummonEditPage({required this.summonData, super.key});

  @override
  ConsumerState<SummonEditPage> createState() => _SummonEditPageState();
}

class _SummonEditPageState extends ConsumerState<SummonEditPage> {
  SummonTemplate? get summonData => widget.summonData;
  static const _name = 'name';
  static const _hitPoints = 'hitPoints';
  static const _armorClass = 'armorClass';
  static const _strength = 'strength';
  static const _dexterity = 'dexterity';
  static const _constitution = 'constitution';
  static const _intelligence = 'intelligence';
  static const _wisdom = 'wisdom';
  static const _charisma = 'charisma';
  static const _proficiency = 'proficiency';

  late final Map<String, TextEditingController> _controllers;
  final Map<String, bool> hasError = {};
  @override
  void initState() {
    super.initState();
    _controllers = {
      _name: TextEditingController(text: summonData?.name),
      _hitPoints: TextEditingController(text: summonData?.hitPoints.toString()),
      _armorClass: TextEditingController(
        text: summonData?.armorClass.toString(),
      ),
      _strength: TextEditingController(text: summonData?.strength.toString()),
      _dexterity: TextEditingController(text: summonData?.dexterity.toString()),
      _constitution: TextEditingController(
        text: summonData?.constitution.toString(),
      ),
      _intelligence: TextEditingController(
        text: summonData?.intelligence.toString(),
      ),
      _wisdom: TextEditingController(text: summonData?.wisdom.toString()),
      _charisma: TextEditingController(text: summonData?.charisma.toString()),
      _proficiency: TextEditingController(
        text: summonData?.proficiency.toString(),
      ),
    };
    for (final key in _controllers.keys) {
      hasError[key] = summonData == null;
    }

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(widgetTreeProvider.notifier).floatingActionButton =
          FloatingActionButton(
            onPressed: _saveSummon,
            child: Icon(Icons.save),
          ),
    );
  }

  @override
  void dispose() {
    for (final stat in _controllers.keys) {
      _controllers[stat]?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _textField(labelText: 'Name', key: _name, isExpression: false),

          Row(
            children: [
              Expanded(
                child: _textField(
                  labelText: 'Hit Points',
                  key: _hitPoints,
                ),
              ),
              Expanded(
                child: _textField(
                  labelText: 'Armor Class',
                  key: _armorClass,
                ),
              ),
            ],
          ),
          _textField(
            labelText: 'Prof-Bonus',
            key: _proficiency,
          ),
          Text('Ability Scores'),
          _textField(
            labelText: 'STR',
            key: _strength,
          ),
          _textField(
            labelText: 'DEX',
            key: _dexterity,
          ),
          _textField(
            labelText: 'CON',
            key: _constitution,
          ),
          _textField(
            labelText: 'INT',
            key: _intelligence,
          ),
          _textField(
            labelText: 'WIS',
            key: _wisdom,
          ),
          _textField(
            labelText: 'CHA',
            key: _charisma,
          ),
        ],
      ),
    );
  }

  Widget _textField({
    required String labelText,
    required String key,
    bool isExpression = true,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: TextField(
          onChanged: (value) {
            setState(() {
              hasError[key] =
                  value.isEmpty ||
                  !(!isExpression || validateExpression(value));
            });
          },
          controller: _controllers[key],
          decoration: InputDecoration(
            error: hasError[key]!
                ? Text(
                    _controllers[key]!.text.isEmpty
                        ? 'erforderlich'
                        : 'Ausdruck nicht erkannt',
                  )
                : null,
            labelText: labelText,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  bool validateExpression(String exp) => StatExpression.tryParse(exp) != null;
  void _saveSummon() {
    if (hasError.values.contains(true)) {
      print('not possible');
      return;
    }
    SummonTemplate(
      name: _controllers[_name]!.text,
      hitPoints: StatExpression.tryParse(_controllers[_hitPoints]!.text)!,
      armorClass: StatExpression.tryParse(_controllers[_armorClass]!.text)!,
      strength: StatExpression.tryParse(_controllers[_strength]!.text)!,
      dexterity: StatExpression.tryParse(_controllers[_dexterity]!.text)!,
      constitution: StatExpression.tryParse(_controllers[_constitution]!.text)!,
      intelligence: StatExpression.tryParse(_controllers[_intelligence]!.text)!,
      wisdom: StatExpression.tryParse(_controllers[_wisdom]!.text)!,
      charisma: StatExpression.tryParse(_controllers[_charisma]!.text)!,
      proficiency: StatExpression.tryParse(_controllers[_proficiency]!.text)!,
    );

    final notifier = ref.read(widgetTreeProvider.notifier);
    notifier.setPage(notifier.templateOverview);
  }
}
