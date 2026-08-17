import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:summon_tracker/notifiers/edit_template_notifier.dart';
import 'package:summon_tracker/views/widgets/separator_line.dart';
import 'package:summon_tracker/views/widgets/separator_title.dart';
import 'package:summon_tracker/views/widgets/template_editing/damage_mods_edit.dart';
import 'package:summon_tracker/views/widgets/template_editing/free_text_formfield.dart';
import 'package:summon_tracker/views/widgets/template_editing/numeric_expression_formfield.dart';
import 'package:summon_tracker/views/widgets/template_editing/my_text_field.dart';

class EditPage0 extends ConsumerStatefulWidget {
  const EditPage0({super.key});

  @override
  ConsumerState<EditPage0> createState() => _EditPage0State();
}

class _EditPage0State extends ConsumerState<EditPage0> {
  EditTemplateNotifier get notifier => ref.read(editTemplateProvider.notifier);
  void updateState(
    EditTemplateState Function(EditTemplateState state) update,
  ) => notifier.updateState(update);

  @override
  Widget build(BuildContext context) {
    final state = ref.read(editTemplateProvider);
    return ListView(
      children: [
        MyTextField(
          label: 'Name',
          initialValue: state.name,
        ),

        SeparatorLine(),
        NumericExpressionFormfield(
          isRequired: true,
          initialValue: state.armorClass,
          label: 'Armor Class',
          onChanged: (value) {
            updateState(
              (state) => state.copyWith(armorClass: value),
            );
          },
          onSaved: (value) {},
        ),
        NumericExpressionFormfield(
          isRequired: true,
          label: 'Hit Points',
          initialValue: state.hitPoints,

          onChanged: (value) {
            updateState(
              (state) => state.copyWith(hitPoints: value),
            );
          },
          onSaved: (value) {},
        ),
        FreeTextFormfield(
          isRequired: false,
          initialValue: state.speed,
          label: 'Speed',
          onChanged: (value) {
            updateState(
              (state) => state.copyWith(speed: value),
            );
          },
          onSaved: (value) {},
        ),
        SeparatorLine(),

        FreeTextFormfield(
          isRequired: false,
          label: 'Senses',
          initialValue: state.senses,
          onChanged: (value) {
            updateState(
              (state) => state.copyWith(senses: value),
            );
          },
          onSaved: (value) {},
        ),
        FreeTextFormfield(
          isRequired: false,
          label: 'Languages',
          initialValue: state.languages,
          onChanged: (value) {
            updateState(
              (state) => state.copyWith(languages: value),
            );
          },
          onSaved: (value) {},
        ),
        NumericExpressionFormfield(
          isRequired: true,
          label: 'Proficiency Bonus',
          initialValue: state.proficiencyBonus,
          onChanged: (value) {
            updateState(
              (state) => state.copyWith(proficiencyBonus: value),
            );
          },
          onSaved: (value) {},
        ),
        SeparatorTitle(
          title: 'Damage modifiers',
        ),
        DamageModsEdit(),
        SizedBox(
          height: 200,
        ),
      ],
    );
  }
}
