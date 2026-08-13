import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:my_utils/my_utils.dart';
import 'package:summon_tracker/notifiers/edit_template_notifier.dart';
import 'package:summon_tracker/services/rulebook.dart';

class SkillsEdit extends ConsumerStatefulWidget {
  const SkillsEdit({super.key});

  @override
  ConsumerState<SkillsEdit> createState() => _SkillsEditState();
}

class _SkillsEditState extends ConsumerState<SkillsEdit> {
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
      children: [
        ...state.skillProficiencies.map(
          (skill) => _skillChoice(skill.skillName),
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
                  _setSkill(text, Proficiency.none);
                }
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }

  Widget _skillChoice(
    String skillName,
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
                Text(skillName),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 30),
                  child: MultiChoiceButton(
                    itemPadding: EdgeInsetsGeometry.symmetric(
                      horizontal: 2.0,
                    ),
                    items: Proficiency.values
                        .map(
                          (prof) => MultiChoiceButtonItem(
                            onSelected: () => _setSkill(skillName, prof),
                            child: Text(
                              prof.short,
                              style: TextStyle(fontSize: 12),
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
              _setSkill(skillName, Proficiency.none, true);
            },
            iconSize: 15,
            icon: Icon(CupertinoIcons.xmark),
          ),
        ),
      ],
    ),
  );

  void _setSkill(String skillName, Proficiency prof, [bool remove = false]) {
    notifier.updateList(
      remove: remove,
      value: SkillProficiency(skillName: skillName, prof: prof),
      getList: (state) => state.skillProficiencies,
      compare: (a, b) => a.skillName == b.skillName,
      update: (state, list) => state.copyWith(skillProficiencies: list),
    );
  }
}
