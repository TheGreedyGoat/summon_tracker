import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:summon_tracker/notifiers/edit_template_notifier.dart';
import 'package:summon_tracker/views/pages/template_edit/edit_decoration.dart';
import 'package:summon_tracker/views/widgets/separator_line.dart';
import 'package:summon_tracker/views/widgets/separator_title.dart';
import 'package:summon_tracker/views/widgets/template_editing/damage_mods_edit.dart';
import 'package:summon_tracker/views/widgets/template_editing/free_text_formfield.dart';
import 'package:summon_tracker/views/widgets/template_editing/numeric_expression_formfield.dart';

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
    return ListView(
      children: [
        EditWrapper(
          child: TextFormField(
            decoration: editInputDecoration.copyWith(
              label: Text('Name'),
            ),
            validator: (value) =>
                value == null || value.trim().isEmpty ? 'erforderlich' : null,
          ),
        ),
        SeparatorLine(),
        NumericExpressionFormfield(
          isRequired: true,
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
          onChanged: (value) {
            updateState(
              (state) => state.copyWith(hitPoints: value),
            );
          },
          onSaved: (value) {},
        ),
        FreeTextFormfield(
          isRequired: true,
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
          isRequired: true,
          label: 'Senses',
          onChanged: (value) {
            updateState(
              (state) => state.copyWith(senses: value),
            );
          },
          onSaved: (value) {},
        ),
        FreeTextFormfield(
          isRequired: true,
          label: 'Languages',
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
