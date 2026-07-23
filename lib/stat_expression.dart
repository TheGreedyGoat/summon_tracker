class StatExpression {
  final String expression;
  final List<String> variableTags;
  const StatExpression({required this.expression, required this.variableTags});

  StatExpression.constant(int value)
    : this(expression: value.toString(), variableTags: []);

  Set<String> getVariableTags() {
    final re = RegExp(r'\[.{1,5}\]');
    final matches = re.allMatches(expression).map((match) {
      return expression.substring(match.start + 1, match.end - 1);
    });
    return matches.map((e) => e.toString()).toSet();
  }

  String getFilledIn(Map<String, int> variableValues) {
    String exp = expression.toString();
    for (final varTag in variableValues.keys) {
      exp = exp.replaceAll(varTag, variableValues[varTag]!.toString());
    }
    return exp;
  }

  @override
  String toString() => expression;
}
