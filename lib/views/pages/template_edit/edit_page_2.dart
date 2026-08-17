import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:summon_tracker/models/action_feature.dart';
import 'package:summon_tracker/notifiers/edit_template_notifier.dart';
import 'package:summon_tracker/models/damage_mod.dart';
import 'package:summon_tracker/views/widgets/separator_title.dart';
import 'package:summon_tracker/views/widgets/template_editing/free_text_formfield.dart';
import 'package:summon_tracker/views/widgets/template_editing/my_text_field.dart';

class EditPage2 extends ConsumerStatefulWidget {
  const EditPage2({super.key});

  @override
  ConsumerState<EditPage2> createState() => _EditPage2State();
}

class _EditPage2State extends ConsumerState<EditPage2> {
  EditTemplateNotifier get notifier => ref.read(editTemplateProvider.notifier);

  void update(EditTemplateState Function(EditTemplateState state) update) =>
      notifier.updateState(update);
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editTemplateProvider);
    return ListView(
      children: [
        _section(
          title: 'Abilities',
          actionAbilities: state.featureAbilities.toList(),
          setList: (state, list) => state.copyWith(featureAbilities: list),
        ),
        _section(
          title: 'Actions',
          actionAbilities: state.actions.toList(),
          setList: (state, list) => state.copyWith(actions: list),
        ),
        _section(
          title: 'Bonus Actions',
          actionAbilities: state.bonusActions.toList(),
          setList: (state, list) => state.copyWith(bonusActions: list),
        ),
        _section(
          title: 'Reactions',
          actionAbilities: state.reactions.toList(),
          setList: (state, list) => state.copyWith(reactions: list),
        ),
      ],
    );
  }

  Widget _section({
    required String title,
    required List<ActionFeature> actionAbilities,
    required EditTemplateState Function(
      EditTemplateState state,
      List<ActionFeature> list,
    )
    setList,
  }) => Column(
    children: [
      SeparatorTitle(
        title: title,
        trailing: IconButton(
          onPressed: () {
            setState(() {
              actionAbilities.add(
                ActionFeature(name: '', description: ''),
              );
              update(
                (state) => setList(state, actionAbilities),
              );
            });
          },
          icon: Icon(Icons.add),
        ),
      ),
      ...actionAbilities.map(
        (aa) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: MyTextField(
                    label: 'Name',
                    isRequired: true,
                    initialValue: aa.name,
                    onChanged: (value) {},
                  ),
                  //  FreeTextFormfield(
                  //   onSaved: (value) {},
                  // ),
                ),
                IconButton(
                  onPressed: () {
                    actionAbilities.removeAt(actionAbilities.indexOf(aa));
                    update(
                      (state) => setList(state, actionAbilities),
                    );
                  },
                  icon: Icon(Icons.remove),
                ),
              ],
            ),
            FreeTextFormfield(
              isMultiline: true,
              isRequired: false,
              initialValue: aa.description,
              onChanged: (String description) {
                final index = actionAbilities.indexOf(aa);
                actionAbilities[index] = aa.copyWith(description: description);
                update(
                  (state) => setList(state, actionAbilities),
                );
              },
              onSaved: (String? value) {},
            ),
          ],
        ),
      ),
    ],
  );
}
