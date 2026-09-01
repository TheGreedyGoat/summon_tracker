import 'package:summon_tracker/logic/models/variable.dart';
import 'package:uuid/uuid.dart';

class SummonInstance {
  final String id;
  final String variantID;
  final List<MyVariable> instanceVariables;
  SummonInstance({
    required this.id,
    required this.variantID,
    required this.instanceVariables,
  });
  @override
  bool operator ==(Object other) => other is SummonInstance && other.id == id;
  @override
  int get hashCode => id.hashCode;
}
