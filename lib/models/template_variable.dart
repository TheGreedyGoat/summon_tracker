import 'package:summon_tracker/models/summon_template.dart';
import 'package:summon_tracker/models/my_variable.dart';

class TemplateVariable {
  static final Set<TemplateVariable> tVariables = {};
  final String templateID;
  final String valueID;

  TemplateVariable({required this.templateID, required this.valueID}) {
    tVariables.remove(this);
    tVariables.add(this);
  }

  SummonTemplate get template => SummonTemplate.templates.singleWhere(
    (template) => template.id == templateID,
  );

  VariableValue get variableValue => VariableValue.values.singleWhere(
    (value) => value.id == valueID,
  );

  @override
  bool operator ==(Object other) =>
      other is TemplateVariable &&
      other.templateID == templateID &&
      other.valueID == valueID;

  @override
  int get hashCode => Object.hash(templateID, valueID);
}
