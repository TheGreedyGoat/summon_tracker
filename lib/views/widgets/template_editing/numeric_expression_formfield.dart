import 'package:flutter/material.dart';
import 'package:summon_tracker/logic/models/numeric_expression.dart';
import 'package:summon_tracker/views/styling/text_styles.dart';
import 'package:summon_tracker/views/widgets/template_editing/edit_decoration.dart';

class NumericExpressionFormfield extends StatefulWidget {
  final bool isRequired;
  final void Function(String value) onChanged;
  final void Function(String? value) onSaved;
  final String? label;
  final String? initialValue;
  const NumericExpressionFormfield({
    super.key,
    this.isRequired = true,
    required this.onChanged,
    required this.onSaved,
    this.label,
    this.initialValue,
  });

  @override
  State<NumericExpressionFormfield> createState() =>
      _NumericExpressionFormfieldState();
}

class _NumericExpressionFormfieldState
    extends State<NumericExpressionFormfield> {
  @override
  Widget build(BuildContext context) {
    return EditWrapper(
      child: TextFormField(
        initialValue: widget.initialValue,
        decoration: InputDecoration(
          label: widget.label != null ? Text(widget.label!) : null,
          hint: Text(
            '[X] + 3',
            style: hintStyle,
          ),
        ),
        onChanged: widget.onChanged,
        validator: (value) {
          if (value == null || value.replaceAll(' ', '').isEmpty) {
            return 'required';
          }

          return _validateNumeric(value) ? null : 'invalid expression';
        },
      ),
    );
  }

  bool _validateNumeric(String value) {
    return NumericExpression.tryParse(value) != null;
  }
}
