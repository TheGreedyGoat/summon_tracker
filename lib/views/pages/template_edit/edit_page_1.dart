import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:summon_tracker/notifiers/edit_template_notifier.dart';
import 'package:summon_tracker/services/rulebook.dart';
import 'package:summon_tracker/views/widgets/separator_line.dart';
import 'package:summon_tracker/views/widgets/template_editing/numeric_expression_formfield.dart';
import 'package:summon_tracker/views/widgets/template_editing/skills_edit.dart';

class EditPage1 extends ConsumerStatefulWidget {
  const EditPage1({
    super.key,
  });

  @override
  ConsumerState<EditPage1> createState() => _EditPage1State();
}

class _EditPage1State extends ConsumerState<EditPage1> {
  EditTemplateNotifier get notifier => ref.read(editTemplateProvider.notifier);
  void updateState(
    EditTemplateState Function(EditTemplateState state) update,
  ) => notifier.updateState(update);

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editTemplateProvider);
    return ListView(
      children: [
        ...state.abilityScores.map(
          (aScore) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: NumericExpressionFormfield(
                  initialValue: aScore.score,
                  label: aScore.ability.short,
                  onChanged: (value) {
                    _updateAbilityScore(aScore.copyWith(score: value));
                  },
                  onSaved: (value) {},
                ),
              ),
              Checkbox(
                value: aScore.saveProficient,
                onChanged: (value) {
                  _updateAbilityScore(aScore.copyWith(saveProficient: value!));
                },
              ),
            ],
          ),
        ),
        SeparatorLine(),
        SkillsEdit(),
        SizedBox(
          height: 200,
        ),
      ],
    );
  }

  void _updateAbilityScore(AbilityScoreString aScore) {
    notifier.updateList(
      value: aScore,
      getList: (state) {
        return state.abilityScores;
      },
      compare: (a, b) => a.ability == b.ability,
      update: (state, list) => state.copyWith(abilityScores: list),
    );
  }
}
