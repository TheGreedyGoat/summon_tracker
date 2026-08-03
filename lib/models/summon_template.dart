import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summon_tracker/models/instance_variable.dart';
import 'package:summon_tracker/models/stat_expression.dart';
import 'package:summon_tracker/models/summon_instance.dart';
import 'package:summon_tracker/models/template_variable.dart';
import 'package:uuid/uuid.dart';

part 'summon_template.freezed.dart';

@freezed
class SummonTemplate with _$SummonTemplate {
  static final Set<SummonTemplate> templates = {};
  final String id;
  final String name;
  final StatExpression hitPoints;
  final StatExpression armorClass;
  final StatExpression strength;
  final StatExpression dexterity;
  final StatExpression constitution;
  final StatExpression intelligence;
  final StatExpression wisdom;
  final StatExpression charisma;
  final StatExpression proficiency;
  SummonTemplate({
    String? id,
    required this.name,
    required this.hitPoints,
    required this.armorClass,
    required this.strength,
    required this.dexterity,
    required this.constitution,
    required this.intelligence,
    required this.wisdom,
    required this.charisma,
    required this.proficiency,
    bool save = true,
  }) : this.id = id ?? Uuid().v1() {
    if (save) {
      templates.remove(this);
      templates.add(this);
    }
  }

  List<StatExpression> get toList {
    return [
      hitPoints,
      armorClass,
      strength,
      dexterity,
      constitution,
      intelligence,
      wisdom,
      charisma,
      proficiency,
    ];
  }

  List<StatExpression> get abilityScores => [
    strength,
    dexterity,
    constitution,
    intelligence,
    wisdom,
    charisma,
  ];

  Set<String> get variableTags {
    return toList.expand((stat) => stat.variableTags).toSet();
  }

  List<SummonInstance> get instances => SummonInstance.instances
      .where(
        (instance) => instance.templateID == id,
      )
      .toList();

  List<TemplateVariable> get templateVariables => TemplateVariable.tVariables
      .where(
        (variable) => variable.templateID == id,
      )
      .toList();

  @override
  bool operator ==(Object other) => other is SummonTemplate && other.id == id;
  @override
  int get hashCode => id.hashCode;
}
