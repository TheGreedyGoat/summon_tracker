import 'package:flutter/material.dart';
import 'package:summon_tracker/views/widgets/template_editing/edit_decoration.dart';

class FreeTextFormfield extends StatefulWidget {
  final bool isRequired;
  final void Function(String value) onChanged;
  final void Function(String? value) onSaved;
  final String? label;
  final String? initialValue;
  final bool isMultiline;
  final Widget? suffix;
  const FreeTextFormfield({
    super.key,
    required this.isRequired,
    required this.onChanged,
    required this.onSaved,
    this.isMultiline = false,
    this.label,
    this.initialValue,
    this.suffix,
  });

  @override
  State<FreeTextFormfield> createState() => _FreeTextFormfieldState();
}

class _FreeTextFormfieldState extends State<FreeTextFormfield> {
  @override
  Widget build(BuildContext context) {
    return EditWrapper(
      child: TextFormField(
        initialValue: widget.initialValue,

        minLines: widget.isMultiline ? 3 : null,
        maxLines: widget.isMultiline ? null : 1,
        decoration: InputDecoration(
          label: widget.label != null ? Text(widget.label!) : null,
          suffixIcon: widget.suffix,
          hint: Text(
            'abc {[X] + 3} 1d6',
            style: TextStyle(color: Colors.black.withAlpha(100)),
          ),
        ),
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        validator: (value) {
          if (widget.isRequired && (value == null || value.trim().isEmpty)) {
            return 'required';
          }

          return null;
        },
      ),
    );
  }
}
