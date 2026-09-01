import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:my_utils/widgets/multi_choice_button.dart';
import 'package:summon_tracker/logic/notifiers/edit_variant_notifier.dart';
import 'package:summon_tracker/logic/models/damage_mod.dart';
import 'package:summon_tracker/views/widgets/labeled_check_box.dart';

/// Widget to edit damage resitances, vulnerabilities etc.
class DamageModsEdit extends ConsumerStatefulWidget {
  /// Widget to edit damage resitances, vulnerabilities etc.
  const DamageModsEdit({super.key});

  @override
  ConsumerState<DamageModsEdit> createState() => _DamageModsEditState();
}

class _DamageModsEditState extends ConsumerState<DamageModsEdit> {
  EditVariantNotifier get notifier => ref.read(editVariantProvider.notifier);
  void update(EditVariantState Function(EditVariantState state) update) =>
      notifier.updateState(update);

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool newTypeIsM = false;
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editVariantProvider);
    return Column(
      spacing: 4.0,
      children: [
        ...state.damageMods.map(
          (modifier) =>
              _modChoice(modifier.damageType, modifier.damageMod.index),
        ),
        _addDamage(),
      ],
    );
  }

  Widget _addDamage() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    spacing: 8.0,
    children: [
      Expanded(
        child: TextField(
          controller: _controller,
          maxLength: 12,
        ),
      ),
      LabeledCheckBox(
        rightLabel: Text('magical'),
        initialValue: newTypeIsM,
        onChanged: (value) {
          setState(() {
            newTypeIsM = value!;
          });
        },
      ),
      IconButton(
        onPressed: () {
          final text = _controller.text.trim();
          if (text.isNotEmpty) {
            final type = DamageType(
              longName: text,
              isMagical: newTypeIsM,
            );
            _controller.clear();
            _setDmgMod(type, DamageMod.none);
            newTypeIsM = false;
          }
        },
        icon: Icon(Icons.add),
      ),
    ],
  );

  /// widget to switch between none, vuln, res and imm
  Widget _modChoice(DamageType dmgType, int? initialValue) => Card(
    color: dmgType.isMagical ? const Color.fromARGB(255, 160, 214, 209) : null,

    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(dmgType.longName),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 30),

                  child: MultiChoiceButton(
                    initialValue: initialValue ?? 0,
                    itemPadding: EdgeInsets.symmetric(
                      horizontal: 2,
                    ),
                    items: [
                      ...DamageMod.values.map(
                        (mod) {
                          return MultiChoiceButtonItem(
                            onSelected: () {
                              _setDmgMod(dmgType, mod);
                            },
                            child: Text(
                              mod.short,
                              style: TextStyle(fontSize: 12),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox.square(
          dimension: 30,
          child: IconButton(
            onPressed: () {
              _setDmgMod(dmgType, DamageMod.none, true);
            },
            iconSize: 15,
            icon: Icon(CupertinoIcons.xmark),
          ),
        ),
      ],
    ),
  );

  void _setDmgMod(DamageType damageType, DamageMod mod, [bool remove = false]) {
    notifier.updateList(
      value: DamageModifier(damageType: damageType, damageMod: mod),
      getList: (state) => state.damageMods,
      compare: (a, b) =>
          a.damageType.longName.toLowerCase() ==
          b.damageType.longName.toLowerCase(),
      update: (state, list) => state.copyWith(damageMods: list),
      remove: remove,
    );
  }
}
