final Map<String, int> variables = {'level': 5, 'con': 5, 'avg': 4};

class Variable {
  final String name;
  final String tag;
  final int value;
  Variable({required this.name, required this.tag, required this.value});

  @override
  bool operator ==(Object other) {
    return other is Variable && other.hashCode == hashCode && other.tag == tag;
  }

  Map<String, dynamic> get toJson => {'tag': tag, 'name': name, 'value': value};

  @override
  String toString() => toJson.toString();

  @override
  int get hashCode => Object.hash('variable', tag);

  Variable copyWith({String? name, int? value}) =>
      Variable(name: name ?? this.name, tag: tag, value: value ?? this.value);
}

class VariableService {
  static VariableService? _instance;

  static VariableService get instance {
    _instance = _instance ?? VariableService._();
    return _instance!;
  }

  final Set<Variable> _variables = {};

  VariableService._();

  bool containsTag(String tag) {
    for (final v in _variables) {
      if (v.tag == tag) return true;
    }
    return false;
  }

  Variable? _getVariable(String tag) {
    for (final v in _variables) {
      if (v.tag == tag) return v;
    }
  }

  List<Variable> get all => _variables.toList();

  Map<String, int> getVariables(List<String> tags) {
    final result = <String, int>{};
    for (final tag in tags) {
      if (!containsTag(tag)) throw ('Unknown Variable tag $tag');
      result[tag] = _getVariable(tag)!.value;
    }
    return result;
  }

  void addVariable(
    String name,
    String tag,
    int value, [
    void Function()? onExistingCallback,
  ]) {
    if (containsTag(tag)) {
      onExistingCallback?.call();
      return;
    }

    _variables.add(Variable(name: name, tag: tag, value: value));
  }

  bool updateVariable(String tag, {String? name, int? value}) {
    final variable = _getVariable(tag);
    if (variable == null) return false;
    final updated = variable.copyWith(name: name, value: value);
    _variables.remove(variable);
    _variables.add(updated);
    return true;
  }

  String variablesToStr() => _variables.toString();
}
