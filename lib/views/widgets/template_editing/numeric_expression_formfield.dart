import 'package:flutter/material.dart';
import 'package:summon_tracker/models/numeric_expression.dart';
import 'package:summon_tracker/views/pages/template_edit/edit_decoration.dart';

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
        decoration: editInputDecoration.copyWith(
          label: widget.label != null ? Text(widget.label!) : null,
        ),
        onChanged: widget.onChanged,
        validator: (value) {
          if (value == null || value.replaceAll(' ', '').isEmpty) {
            return 'required';
          }

          return _validateNumeric(value) ? null : 'invalid';
        },
      ),
    );
  }

  bool _validateNumeric(String value) {
    return NumericExpression.tryParse(value) != null;
  }
}
