import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summon_tracker/services/expression_service.dart';
import 'package:summon_tracker/services/rulebook.dart';

part 'edit_template_notifier.freezed.dart';

final editTemplateProvider = NotifierProvider(
  () => EditTemplateNotifier(),
);

//            dP              dP
//            88              88
// .d8888b. d8888P .d8888b. d8888P .d8888b.
// Y8ooooo.   88   88'  `88   88   88ooood8
//       88   88   88.  .88   88   88.  ...
// `88888P'   dP   `88888P8   dP   `88888P'

@freezed
class EditTemplateState with _$EditTemplateState {
  final String name;

  final String armorClass;
  final String hitPoints;
  final String speed;

  final String senses;
  final String languages;
  final String proficiencyBonus;

  final List<DamageModifier> damageMods;
  // Ability Scores + Save profs
  final List<AbilityScoreString> abilityScores;

  // skills
  final List<SkillProficiency> skillProficiencies;

  // Free Texts
  final List<ActionAbility> featureAbilities;
  final List<ActionAbility> actions;
  final List<ActionAbility> bonusActions;
  final List<ActionAbility> reactions;

  EditTemplateState({
    required this.name,
    required this.armorClass,
    required this.hitPoints,
    required this.speed,
    required this.senses,
    required this.languages,
    required this.proficiencyBonus,
    required this.damageMods,
    required this.abilityScores,
    required this.skillProficiencies,
    required this.featureAbilities,
    required this.actions,
    required this.bonusActions,
    required this.reactions,
  });

  Set<String> get variableTags {
    final Set<String> tags = {};
    for (final raw in [
      armorClass,
      hitPoints,
      speed,
      senses,
      languages,
      proficiencyBonus,
    ]) {
      tags.addAll(ExpressionService.scanForVariables(raw));
    }
    abilityScores.map(
      (a) => tags.addAll(ExpressionService.scanForVariables(a.score)),
    );
    for (final list in [featureAbilities, actions, bonusActions, reactions]) {
      for (final aa in list) {
        tags.addAll(ExpressionService.scanForVariables(aa.description));
      }
    }
    return tags;
  }
}
//                     dP   oo .8888b oo
//                     88      88   "
// 88d888b. .d8888b. d8888P dP 88aaa  dP .d8888b. 88d888b.
// 88'  `88 88'  `88   88   88 88     88 88ooood8 88'  `88
// 88    88 88.  .88   88   88 88     88 88.  ... 88
// dP    dP `88888P'   dP   dP dP     dP `88888P' dP

class EditTemplateNotifier extends Notifier<EditTemplateState> {
  @override
  EditTemplateState build() => blank;

  EditTemplateState get blank => EditTemplateState(
    name: '',
    armorClass: '',
    hitPoints: '',
    speed: '',
    senses: '',
    languages: '',
    proficiencyBonus: '',
    damageMods: BaseDamageType.values
        .map(
          (type) =>
              DamageModifier(damageType: type.name, damageMod: DamageMod.none),
        )
        .toList(),
    abilityScores: Ability.values.map(
      (a) {
        return AbilityScoreString(
          ability: a,
          score: '10',
          saveProficient: false,
        );
      },
    ).toList(),
    skillProficiencies: BaseSkill.values
        .map(
          (skill) =>
              SkillProficiency(skillName: skill.long, prof: Proficiency.none),
        )
        .toList(),
    featureAbilities: [],
    actions: [
      ActionAbility(name: 'Scimitar', description: 'Melee Weapon Attack....'),
    ],
    bonusActions: [],
    reactions: [],
  );

  void updateState(EditTemplateState Function(EditTemplateState state) update) {
    state = update(state);
  }

  void updateList<T>({
    required T value,
    bool remove = false,
    required List<T> Function(EditTemplateState state) getList,
    required bool Function(T a, T b) compare,
    required EditTemplateState Function(EditTemplateState state, List<T> list)
    update,
  }) {
    final list = getList(state).toList();
    if (remove) {
      list.removeWhere(
        (element) => compare(value, element),
      );
    } else {
      final index = list.indexWhere(
        (element) => compare(value, element),
      );

      if (index < 0) {
        list.add(value);
      } else {
        list[index] = value;
      }
    }

    state = update(state, list);
  }
}
