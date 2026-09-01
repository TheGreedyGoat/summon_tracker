import 'package:uuid/uuid.dart';

class VariableValue {
  static final Set<VariableValue> values = {};
  final String id;
  final String tag;
  final int value;

  VariableValue({String? id, required this.tag, required this.value})
    : this.id = id ?? Uuid().v1();

  @override
  bool operator ==(Object other) => other is VariableValue && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
