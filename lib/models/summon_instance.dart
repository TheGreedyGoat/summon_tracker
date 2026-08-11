import 'package:summon_tracker/models/instance_variable.dart';
import 'package:uuid/uuid.dart';

class SummonInstance {
  static final Set<SummonInstance> instances = {};
  final String id;
  final String templateID;
  SummonInstance({
    String? id,
    required this.templateID,
  }) : this.id = id ?? Uuid().v1() {
    instances.remove(this);
    instances.add(this);
  }

  List<InstanceVariable> get instanceVariables => InstanceVariable.iVariables
      .where(
        (iVariable) => iVariable.instanceID == id,
      )
      .toList();

  @override
  bool operator ==(Object other) => other is SummonInstance && other.id == id;
  @override
  int get hashCode => id.hashCode;
}
