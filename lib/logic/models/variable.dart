import 'package:summon_tracker/logic/services/database/data_base_tables.dart';
import 'package:uuid/uuid.dart';

class MyVariable {
  final String id;
  final String displayName;
  final String tag;
  final int? value;

  MyVariable({
    String? id,
    required this.displayName,
    required this.tag,
    this.value,
  }) : this.id = id ?? Uuid().v1();

  Map<String, dynamic> toJson() => {
    Columns.variable_id: id,
    Columns.variable_display_name: displayName,
    Columns.variable_tag: tag,
    Columns.variable_value: value,
  };
}

class MyVariableSet extends MyVariable {
  @override
  int get value => super.value!;

  MyVariableSet({
    required super.displayName,
    required super.tag,
    required int value,
  }) : super(value: value);
}
