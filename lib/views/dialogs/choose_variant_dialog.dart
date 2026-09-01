import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:summon_tracker/logic/models/summons/summon_variant.dart';
import 'package:summon_tracker/views/widgets/separator_title.dart';

Future<int> chooseVariantDialog(
  List<SummonVariant> variants,
  BuildContext context,
) async {
  return await showDialog<int>(
        context: context,
        builder: (context) => Dialog(
          child: _ChooseVariantDialog(
            variants: variants,
          ),
        ),
      ) ??
      0;
}

class _ChooseVariantDialog extends StatefulWidget {
  final List<SummonVariant> variants;

  const _ChooseVariantDialog({super.key, required this.variants});

  @override
  State<_ChooseVariantDialog> createState() => _ChooseVariantDialogState();
}

class _ChooseVariantDialogState extends State<_ChooseVariantDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SeparatorTitle(title: 'Chose a variant'),
        for (int i = 0; i < widget.variants.length; i++)
          ListTile(
            title: Text(widget.variants[i].name),
            trailing: IconButton(
              onPressed: () {
                Navigator.pop(context, i);
              },
              icon: Icon(Icons.chevron_right),
            ),
          ),
      ],
    );
  }
}
