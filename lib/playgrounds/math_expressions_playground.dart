import 'package:math_expressions/math_expressions.dart';

void main() {
  _expressionCreationEval();
}

void _expressionCreationEval() {
  // === Create Expression ===

  // Programmatically
  final x = Variable('x'), y = Variable('y');
  final xSquare = Power(x, 2);
  final Expression exp1 = xSquare + y;

  // Parser
  ExpressionParser p = GrammarParser();
  final Expression exp2 = p.parse('x + y');

  //=== Bind Variables ===
  final ctxModel = ContextModel()
    ..bindVariableName('x', Number(2))
    ..bindVariable(y, Number(10));

  // evaluate
  final evaluator = RealEvaluator(ctxModel);
  num eval1 = evaluator.evaluate(exp1);
  num eval2 = evaluator.evaluate(exp2);

  print('EVAL1: $eval1');
  print('EVAL2: $eval2');
}
