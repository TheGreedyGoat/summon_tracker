import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:my_utils/widgets/multi_choice_button.dart';
import 'package:summon_tracker/notifiers/edit_template_notifier.dart';
import 'package:summon_tracker/models/damage_mod.dart';

/// Widget to edit damage resitances, vulnerabilities etc.
class DamageModsEdit extends ConsumerStatefulWidget {
  /// Widget to edit damage resitances, vulnerabilities etc.
  const DamageModsEdit({super.key});

  @override
  ConsumerState<DamageModsEdit> createState() => _DamageModsEditState();
}

class _DamageModsEditState extends ConsumerState<DamageModsEdit> {
  EditTemplateNotifier get notifier => ref.read(editTemplateProvider.notifier);
  void update(EditTemplateState Function(EditTemplateState state) update) =>
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

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editTemplateProvider);
    return Column(
      spacing: 4.0,
      children: [
        ...state.damageMods.map(
          (modifier) =>
              _modChoice(modifier.damageType, modifier.damageMod.index),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
              ),
            ),
            IconButton(
              onPressed: () {
                final text = _controller.text.trim();
                if (text.isNotEmpty) {
                  _controller.clear();
                  _setDmgMod(text, DamageMod.none);
                }
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }

  Widget _modChoice(String damageName, int? initialValue) => Card(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(damageName),
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
                              _setDmgMod(damageName, mod);
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
              _setDmgMod(damageName, DamageMod.none, true);
            },
            iconSize: 15,
            icon: Icon(CupertinoIcons.xmark),
          ),
        ),
      ],
    ),
  );

  void _setDmgMod(String damageType, DamageMod mod, [bool remove = false]) {
    notifier.updateList(
      value: DamageModifier(damageType: damageType, damageMod: mod),
      getList: (state) => state.damageMods,
      compare: (a, b) =>
          a.damageType.toLowerCase() == b.damageType.toLowerCase(),
      update: (state, list) => state.copyWith(damageMods: list),
      remove: remove,
    );
  }
}
