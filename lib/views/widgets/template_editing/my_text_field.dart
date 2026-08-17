import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:summon_tracker/views/styling/text_styles.dart';
import 'package:summon_tracker/views/widgets/template_editing/edit_decoration.dart';

class MyTextField extends ConsumerStatefulWidget {
  final String label;
  final String hintText;
  final String? initialValue;
  final bool isRequired;
  final void Function(String? value)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  const MyTextField({
    super.key,
    required this.label,
    this.hintText = 'abc',
    this.onChanged,
    this.initialValue,
    this.isRequired = true,
    this.inputFormatters,
  });

  /// creates a textfield for digits
  MyTextField.digitsOnly({
    required this.label,
    this.hintText = '123',
    this.onChanged,
    this.initialValue,
    this.isRequired = true,
  }) : this.inputFormatters = [
         FilteringTextInputFormatter.digitsOnly,
       ];

  @override
  ConsumerState<MyTextField> createState() => _TextFieldStringState();
}

class _TextFieldStringState extends ConsumerState<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return EditWrapper(
      child: TextFormField(
        initialValue: widget.initialValue,
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hintText,
          hintStyle: hintStyle,
        ),
        inputFormatters: widget.inputFormatters,
        onChanged: widget.onChanged,
        validator: (value) {
          if (widget.isRequired && (value == null || value.trim().isEmpty)) {
            return 'field is required';
          }
        },
      ),
    );
  }
}
