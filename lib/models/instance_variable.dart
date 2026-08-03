class InstanceVariable {
  static final Set<InstanceVariable> iVariables = {};
  final String instanceID;
  final String valueID;

  InstanceVariable({required this.instanceID, required this.valueID}) {
    iVariables.remove(this);
    iVariables.add(this);
  }

  @override
  bool operator ==(Object other) =>
      other is InstanceVariable &&
      other.instanceID == instanceID &&
      other.valueID == valueID;

  @override
  int get hashCode => Object.hash(instanceID, valueID);
}
