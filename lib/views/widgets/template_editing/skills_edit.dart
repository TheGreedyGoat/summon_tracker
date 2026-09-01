import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:my_utils/my_utils.dart';
import 'package:summon_tracker/logic/models/ability.dart';
import 'package:summon_tracker/logic/models/skill.dart';
import 'package:summon_tracker/logic/notifiers/edit_variant_notifier.dart';
import 'package:summon_tracker/logic/models/damage_mod.dart';

class SkillsEdit extends ConsumerStatefulWidget {
  const SkillsEdit({super.key});

  @override
  ConsumerState<SkillsEdit> createState() => _SkillsEditState();
}

class _SkillsEditState extends ConsumerState<SkillsEdit> {
  EditVariantNotifier get notifier => ref.read(editVariantProvider.notifier);

  void update(EditVariantState Function(EditVariantState state) update) =>
      notifier.updateState(update);

  final TextEditingController _controller = TextEditingController();
  Ability newSkillAbility = Ability.str;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editVariantProvider);
    return Column(
      children: [
        ...state.skillProficiencies.map(
          (skill) => _skillChoice(skill.skill),
        ),
        _addSkill(),
      ],
    );
  }

  Widget _addSkill() => Row(
    spacing: 8.0,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: TextField(
          controller: _controller,
          maxLength: 12,
        ),
      ),
      DropdownButton<Ability>(
        value: newSkillAbility,
        items: [
          ...Ability.values.map(
            (ab) => DropdownMenuItem(
              child: Text(ab.long),
              value: ab,
            ),
          ),
        ],
        onChanged: (value) {
          setState(() {
            newSkillAbility = value ?? newSkillAbility;
          });
        },
      ),
      IconButton(
        onPressed: () {
          final text = _controller.text.trim();
          if (text.isNotEmpty) {
            _controller.clear();
            _setSkill(
              Skill(name: text, ability: newSkillAbility),
              Proficiency.none,
            );
          }
        },
        icon: Icon(Icons.add),
      ),
    ],
  );

  Widget _skillChoice(
    Skill skill,
  ) => Card(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: ' (${skill.ability.short}) ',
                        style: TextStyle(fontSize: 12),
                      ),
                      TextSpan(text: skill.name),
                    ],
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 30),
                  child: MultiChoiceButton(
                    itemPadding: EdgeInsetsGeometry.symmetric(
                      horizontal: 2.0,
                    ),
                    items: Proficiency.values
                        .map(
                          (prof) => MultiChoiceButtonItem(
                            onSelected: () => _setSkill(skill, prof),
                            child: Text(
                              prof.short,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        )
                        .toList(),
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
              _setSkill(skill, Proficiency.none, true);
            },
            iconSize: 15,
            icon: Icon(CupertinoIcons.xmark),
          ),
        ),
      ],
    ),
  );

  void _setSkill(Skill skill, Proficiency prof, [bool remove = false]) {
    notifier.updateList(
      remove: remove,
      value: SkillProficiency(skill: skill, prof: prof),
      getList: (state) => state.skillProficiencies,
      compare: (a, b) => a.skill == b.skill,
      update: (state, list) => state.copyWith(skillProficiencies: list),
    );
  }
}
