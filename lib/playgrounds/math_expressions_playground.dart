import 'package:math_expressions/math_expressions.dart';
import 'package:math_parser/math_parser.dart';
import 'package:summon_tracker/models/numeric_expression.dart';
import 'package:summon_tracker/services/expression_service.dart';

void main() {
  final expression = '3 * (4 + x * (2 - 8 * 2) -y) + y';
  final simplified = ExpressionService.simplify(expression);

  print(simplified);
  print(MathNodeExpression.fromString('3*-1').calc(MathVariableValues.none));
  // for (int x = 0; x < 20; x++) {
  // for (int y = 0; y < 20; y++) {
  // final variableValues = <String, int>{
  //   'x': 1,
  //   'y': 1,
  // };
  // final original = MathNodeExpression.fromString(
  //   expression,
  // ).calc(MathVariableValues(variableValues));

  // print(original);
  // =>3x -7(...)-12 *(...) +10
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

void _simplify() {
  final x = Variable('x'), y = Variable('y');

  final p = GrammarParser();
  final Expression exp = p.parse('5 + 8 + 3 * x + 4 + 9 * y');

  print(exp);
  print(exp.simplify());
}

void _testStatExpression() {
  final exp = NumericExpression.tryParse('[DEX] + [Prof]')!;
  final values = <String, int>{
    'DEX': 5,
    'Prof': 3,
  };

  print(exp.variables);
}
