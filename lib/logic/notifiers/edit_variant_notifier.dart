import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summon_tracker/logic/models/ability.dart';
import 'package:summon_tracker/logic/models/action_feature.dart';
import 'package:summon_tracker/logic/models/free_text.dart';
import 'package:summon_tracker/logic/models/numeric_expression.dart';
import 'package:summon_tracker/logic/models/skill.dart';
import 'package:summon_tracker/logic/models/summons/summon_master.dart';
import 'package:summon_tracker/logic/models/summons/summon_variant.dart';
import 'package:summon_tracker/logic/models/variable.dart';
import 'package:summon_tracker/logic/services/expression_service.dart';
import 'package:summon_tracker/logic/models/damage_mod.dart';
import 'package:uuid/uuid.dart';

part 'edit_variant_notifier.freezed.dart';

/// Provider for values while editing a [SummonVariant]
final editVariantProvider = NotifierProvider(
  () => EditVariantNotifier(),
);

//            dP              dP
//            88              88
// .d8888b. d8888P .d8888b. d8888P .d8888b.
// Y8ooooo.   88   88'  `88   88   88ooood8
//       88   88   88.  .88   88   88.  ...
// `88888P'   dP   `88888P8   dP   `88888P'

@freezed
/// State that tracks what the user entered in the editing page.
///
/// Whenever a SummonTemplate is edited, convert it to an EditTemplateState first
class EditVariantState with _$EditVariantState {
  /// The summoned creatures display name
  ///
  /// Will convert to: String
  @override
  final String name;

  /// Will convert to: [NumericExpression]

  @override
  final String armorClass;

  /// Will convert to: [NumericExpression]

  @override
  final String hitPoints;
  @override
  final String speed;

  @override
  final String senses;
  @override
  final String languages;

  /// Will convert to: [NumericExpression]
  @override
  final String proficiencyBonus;

  @override
  final List<DamageModifier> damageMods;
  // Ability Scores + Save profs
  @override
  final List<AbilityScoreString> abilityScores;

  // skills
  @override
  final List<SkillProficiency> skillProficiencies;

  // Free Texts
  @override
  final List<ActionFeature> featureAbilities;
  @override
  final List<ActionFeature> actions;
  @override
  final List<ActionFeature> bonusActions;
  @override
  final List<ActionFeature> reactions;

  /// keys: Variable tags
  /// values: either the variable value or 'inst', if set on summon is set
  final Map<String, String> variableState;

  /// maps the variable tags to their display names
  final Map<String, String> variableNames;

  Map<String, String> get copyVState => variableState.map(
    (key, value) => MapEntry(key, value),
  );
  Map<String, String> get copyNames => variableNames.map(
    (key, value) => MapEntry(key, value),
  );

  /// State that tracks what the user entered in the editing page.
  ///
  /// Whenever a SummonTemplate is edited, convert it to an EditTemplateState first
  EditVariantState({
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
    required this.variableState,
    required this.variableNames,
  });

  EditVariantState.blank()
    : this.name = '',
      this.armorClass = '',
      this.hitPoints = '',
      this.speed = '',
      this.senses = '',
      this.languages = '',
      this.proficiencyBonus = '',
      this.damageMods = CoreDamageType.values
          .map(
            (type) => DamageModifier(
              damageType: type.getDmgType(),
              damageMod: DamageMod.none,
            ),
          )
          .toList(),
      abilityScores = Ability.values.map(
        (a) {
          return AbilityScoreString(
            ability: a,
            score: '10',
            proficiency: Proficiency.none,
          );
        },
      ).toList(),
      skillProficiencies = CoreSkill.values
          .map(
            (coreSkill) => SkillProficiency(
              skill: coreSkill.skill,
              prof: Proficiency.none,
            ),
          )
          .toList(),
      this.featureAbilities = const [],
      this.actions = const [],
      this.bonusActions = const [],
      this.reactions = const [],
      this.variableState = const {},
      this.variableNames = const {};

  factory EditVariantState.fromMaster({
    required SummonMaster master,
    int? index,
  }) {
    if (index != null &&
        index >= 0 &&
        master.variants.elementAtOrNull(index) != null) {
      final variant = master.variants[index!];
      return EditVariantState(
        name: variant.name,
        armorClass: variant.armorClass.raw,
        hitPoints: variant.hitPoints.raw,
        speed: variant.speed.raw,
        senses: variant.senses.raw,
        languages: variant.languages.raw,
        proficiencyBonus: variant.proficiencyBonus.raw,
        damageMods: variant.damageMods,
        abilityScores: variant.abilityScores
            .map(
              (e) => e.asString,
            )
            .toList(),
        skillProficiencies: variant.skillProficiencies,
        featureAbilities: variant.featAbilities,
        actions: variant.actions,
        bonusActions: variant.bonusActions,
        reactions: variant.reactions,
        variableState: {},
        variableNames: {},
      );
    }
    return EditVariantState.blank().copyWith(name: master.name);
  }

  List<String> get numerics => [
    armorClass,
    hitPoints,
    proficiencyBonus,
    ...abilityScores.map(
      (aScore) => aScore.score,
    ),
  ];

  // List get numerics => <String>[
  //   armorClass,
  //   hitPoints,proficiencyBonus,
  //   // ...abilityScores.map((aScore) => aScore.score,)
  // ];

  /// ### collects all [X] variables in all the text fields and returns them as a set
  ///
  /// case sensitive
  Set<String> get variableTags {
    final Set<String> tags = {};
    // All single fields
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
    // Ability scores
    for (final aScore in abilityScores) {
      tags.addAll(ExpressionService.scanForVariables(aScore.score));
    }
    // abilityScores.map(
    //   (a) => tags.addAll(ExpressionService.scanForVariables(a.score)),
    // );
    // actions etc.
    for (final list in [featureAbilities, actions, bonusActions, reactions]) {
      for (final aa in list) {
        tags.addAll(ExpressionService.scanForVariables(aa.description));
      }
    }
    return tags;
  }

  /// checks all occuring variables within the textfields
  /// and returns true, if they all either have a value set or are
  /// marked as instance variables
  String? validateVariables() {
    final Set<String> unset = {};
    final Set<String> unnamed = {};
    for (final v in variableTags) {
      if (variableState[v] == null) {
        unset.add(v);
      }
      if (variableNames[v] == null) {
        unnamed.add(v);
      }
    }
    String? answer;
    if (unset.isNotEmpty) {
      answer =
          'following variables are unset:\n${unset.fold(
            '',
            (previousValue, element) => '$previousValue$element,',
          )}\n';
    }
    if (unnamed.isNotEmpty) {
      answer ??= '';
      answer +=
          'following variables are unnamed:\n${unnamed.fold(
            '',
            (previousValue, element) => '$previousValue$element,',
          )}';
    }
    return answer;
  }

  bool validateNumerics() => numerics.fold(
    true,
    (previousValue, numeric) {
      return NumericExpression.tryParse(numeric) != null;
    },
  );
  bool validateAll() {
    return validateVariables() == null && validateNumerics();
  }

  AbilityScoreString getAbility(Ability ab) => abilityScores.firstWhere(
    (element) => element.ability == ab,
  );

  SummonVariant? toVariant(SummonMaster master) {
    if (!validateAll()) return null;

    return SummonVariant(
      id: Uuid().v1(),
      name: name,
      masterID: master.id,
      armorClass: NumericExpression.tryParse(armorClass)!,
      hitPoints: NumericExpression.tryParse(hitPoints)!,
      speed: FreeText(raw: speed),
      senses: FreeText(raw: senses),
      languages: FreeText(raw: languages),
      proficiencyBonus: NumericExpression.tryParse(proficiencyBonus)!,
      damageMods: damageMods,
      strengthScore: getAbility(Ability.str).asNumeric!,
      dexterityScore: getAbility(Ability.dex).asNumeric!,
      constitutionScore: getAbility(Ability.con).asNumeric!,
      intelligenceScore: getAbility(Ability.int).asNumeric!,
      wisdomScore: getAbility(Ability.wis).asNumeric!,
      charismaScore: getAbility(Ability.cha).asNumeric!,
      skillProficiencies: skillProficiencies,
      featAbilities: featureAbilities,
      bonusActions: bonusActions,
      reactions: reactions,
      actions: actions,
      variantVariables: variantVariables,
      instanceVariables: instanceVariables,
    );
  }

  List<MyVariable> get instanceVariables {
    final result = List<MyVariable>.empty(growable: true);
    variableState.forEach(
      (tag, value) {
        if (value == 'inst') {
          result.add(
            MyVariable(displayName: variableNames[tag]!, tag: tag, value: null),
          );
        }
      },
    );
    return result;
  }

  List<MyVariableSet> get variantVariables {
    final result = List<MyVariableSet>.empty(growable: true);
    variableState.forEach(
      (tag, value) {
        int? number = int.tryParse(value);
        if (number != null) {
          result.add(
            MyVariableSet(
              displayName: variableNames[tag] ?? '404',
              tag: tag,
              value: number,
            ),
          );
        }
      },
    );
    return result;
  }
}
//                     dP   oo .8888b oo
//                     88      88   "
// 88d888b. .d8888b. d8888P dP 88aaa  dP .d8888b. 88d888b.
// 88'  `88 88'  `88   88   88 88     88 88ooood8 88'  `88
// 88    88 88.  .88   88   88 88     88 88.  ... 88
// dP    dP `88888P'   dP   dP dP     dP `88888P' dP

/// Notifier for values while editing a [SummonVariant]
class EditVariantNotifier extends Notifier<EditVariantState> {
  @override
  EditVariantState build() => EditVariantState.blank();

  void reset() => state = EditVariantState.blank();
  void setFromMaster({required SummonMaster master, int? index}) {
    state = EditVariantState.fromMaster(master: master, index: index);
  }

  //                        888          888            .d8888b.  888             888
  //                        888          888           d88P  Y88b 888             888
  //                        888          888           Y88b.      888             888
  // 888  888 88888b.   .d88888  8888b.  888888 .d88b.  "Y888b.   888888  8888b.  888888 .d88b.
  // 888  888 888 "88b d88" 888     "88b 888   d8P  Y8b    "Y88b. 888        "88b 888   d8P  Y8b
  // 888  888 888  888 888  888 .d888888 888   88888888      "888 888    .d888888 888   88888888
  // Y88b 888 888 d88P Y88b 888 888  888 Y88b. Y8b.    Y88b  d88P Y88b.  888  888 Y88b. Y8b.
  //  "Y88888 88888P"   "Y88888 "Y888888  "Y888 "Y8888  "Y8888P"   "Y888 "Y888888  "Y888 "Y8888
  //          888
  //          888
  //          888
  /// passes the current state to [update] and then sets state to the returned value.
  ///
  /// It is reccommended to use tghe [update] function to invoke the state's copyWith
  ///
  /// eg:
  ///
  /// ```dart
  /// ref.read(editTemplateProvider.notifier).updateState(
  ///   updateState((state) => state.copyWith(armorClass: '10 + [DEX]'),);
  /// )
  /// ```
  ///
  ///
  @override
  set state(EditVariantState newState) {
    final newTags = newState.variableTags;
    final newValues = newState.copyVState;
    newValues.removeWhere(
      (tag, value) => !newTags.contains(tag),
    );
    final newNames = newState.copyNames;
    newNames.removeWhere(
      (tag, value) => !newTags.contains(tag),
    );
    super.state = newState.copyWith(
      variableState: newValues,
      variableNames: newNames,
    );
  }

  void updateState(EditVariantState Function(EditVariantState state) update) {
    state = update(state);
  }

  //                        888          888            888      d8b          888
  //                        888          888            888      Y8P          888
  //                        888          888            888                   888
  // 888  888 88888b.   .d88888  8888b.  888888 .d88b.  888      888 .d8888b  888888
  // 888  888 888 "88b d88" 888     "88b 888   d8P  Y8b 888      888 88K      888
  // 888  888 888  888 888  888 .d888888 888   88888888 888      888 "Y8888b. 888
  // Y88b 888 888 d88P Y88b 888 888  888 Y88b. Y8b.     888      888      X88 Y88b.
  //  "Y88888 88888P"   "Y88888 "Y888888  "Y888 "Y8888  88888888 888  88888P'  "Y888
  //          888
  //          888
  //          888
  /// Use to add, update or remove values within a list of the state
  ///
  /// - [value]: the value to add, update or remove
  /// - [remove]: If set to true, [value] will be tried to remove from the list,
  /// else it will be added or updated
  /// - [getList]: tells this function wich list to pick
  /// - [compare]: [value] will be compared to every item within the list using this function.
  /// The first item found will be replaced by [value]. If none is found, [value] is added to the list's end
  /// - [update]: How to update the state once the list has changed?
  ///
  /// example:
  ///
  /// ```dart
  /// final notifier = ref.read(editTemplateProvider.notifier);
  /// notifier
  /// .updateState(
  ///   (state) => state.copyWith(armorClass: '10 + [DEX]'),
  /// );
  /// ```
  void updateList<T>({
    required T value,
    bool remove = false,
    required List<T> Function(EditVariantState state) getList,
    required bool Function(T a, T b) compare,
    required EditVariantState Function(EditVariantState state, List<T> list)
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

  //                        888          888           888     888
  //                        888          888           888     888
  //                        888          888           888     888
  // 888  888 88888b.   .d88888  8888b.  888888 .d88b. Y88b   d88P 8888b.  888d888 .d8888b
  // 888  888 888 "88b d88" 888     "88b 888   d8P  Y8b Y88b d88P     "88b 888P"   88K
  // 888  888 888  888 888  888 .d888888 888   88888888  Y88o88P  .d888888 888     "Y8888b.
  // Y88b 888 888 d88P Y88b 888 888  888 Y88b. Y8b.       Y888P   888  888 888          X88
  //  "Y88888 88888P"   "Y88888 "Y888888  "Y888 "Y8888     Y8P    "Y888888 888      88888P'
  //          888
  //          888
  //          888

  /// updates the state, setting the variable with the given [tag] to [value]
  void setVariableValue(String tag, int value) {
    final vValues = state.copyVState;
    vValues[tag] = value.toString();
    state = state.copyWith(variableState: vValues);
  }

  /// marks the variable with given [tag] to be set when the template is summoned
  /// (=> doesnt get a value yet)
  void setVariableInstance(String tag, bool value) {
    print('settinc inst for $tag to $value');
    final vValues = state.copyVState;
    if (value) {
      vValues[tag] = 'inst';
    } else {
      vValues.remove(tag);
    }
    state = state.copyWith(variableState: vValues);
  }

  /// sets a display name for the specified variable
  void setVariableName(String tag, String? name) {
    final names = state.copyNames;
    name == null || name.trim().isEmpty ? names.remove(tag) : names[tag] = name;
    state = state.copyWith(variableNames: names);
  }
}
